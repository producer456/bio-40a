import SwiftUI

// MARK: - Study Task Model

struct StudyTask: Identifiable {
    let id = UUID()
    let priority: TaskPriority
    let icon: String
    let title: String
    let subtitle: String
    let estimatedMinutes: Int
    let action: StudyAction
    let urgencyColor: Color

    enum TaskPriority: Int, Comparable {
        case pastDue = 0
        case dueTomorrow = 1
        case dueThisWeek = 2
        case incompleteLessons = 3
        case dueFlashcards = 4
        case lowQuizScores = 5
        case upcomingExamPrep = 6

        static func < (lhs: TaskPriority, rhs: TaskPriority) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    enum StudyAction {
        case lesson(String)        // lessonId
        case quiz(String)          // quizId
        case flashcardDeck(String) // deckId
        case assignment(String)    // assignmentId
        case tab(Int)              // fallback: switch to tab
    }
}

// MARK: - Study Plan Generator

class StudyPlanGenerator: ObservableObject {
    @Published var tasks: [StudyTask] = []
    @Published var totalEstimatedMinutes: Int = 0

    func generate(progress: ProgressManager) {
        var allTasks: [StudyTask] = []
        let now = Date()
        let calendar = Calendar.current

        // Current week number based on course schedule (Week 1 starts Apr 6, 2026)
        let courseStartComponents = DateComponents(year: 2026, month: 4, day: 6)
        let courseStart = calendar.date(from: courseStartComponents) ?? now
        let daysSinceStart = max(0, calendar.dateComponents([.day], from: calendar.startOfDay(for: courseStart), to: calendar.startOfDay(for: now)).day ?? 0)
        let currentWeek = min(12, max(1, (daysSinceStart / 7) + 1))

        // ── 1. Past-due assignments ──
        let pastDue = AssignmentData.allAssignments.filter {
            $0.isPastDue && !progress.isAssignmentComplete($0.id)
        }
        for a in pastDue {
            let days = abs(a.daysUntilDue)
            allTasks.append(StudyTask(
                priority: .pastDue,
                icon: "exclamationmark.triangle.fill",
                title: "\(a.code): \(a.title)",
                subtitle: "\(days) day\(days == 1 ? "" : "s") overdue \u{2022} \(a.points) pts",
                estimatedMinutes: estimatedTime(for: a.type),
                action: .assignment(a.id),
                urgencyColor: .red
            ))
        }

        // ── 2. Due tomorrow assignments ──
        let dueTomorrow = AssignmentData.allAssignments.filter {
            $0.isDueTomorrow && !progress.isAssignmentComplete($0.id)
        }
        for a in dueTomorrow {
            allTasks.append(StudyTask(
                priority: .dueTomorrow,
                icon: "clock.badge.exclamationmark.fill",
                title: "\(a.code): \(a.title)",
                subtitle: "Due tomorrow \u{2022} \(a.points) pts",
                estimatedMinutes: estimatedTime(for: a.type),
                action: .assignment(a.id),
                urgencyColor: .orange
            ))
        }

        // ── 2b. Due today assignments ──
        let dueToday = AssignmentData.allAssignments.filter {
            $0.isDueToday && !progress.isAssignmentComplete($0.id)
        }
        for a in dueToday {
            allTasks.append(StudyTask(
                priority: .dueTomorrow,
                icon: "clock.badge.exclamationmark.fill",
                title: "\(a.code): \(a.title)",
                subtitle: "Due today \u{2022} \(a.points) pts",
                estimatedMinutes: estimatedTime(for: a.type),
                action: .assignment(a.id),
                urgencyColor: .orange
            ))
        }

        // ── 2c. Due this week (2-6 days out) ──
        let dueThisWeek = AssignmentData.allAssignments.filter {
            $0.daysUntilDue >= 2 && $0.daysUntilDue <= 6 && !progress.isAssignmentComplete($0.id)
        }.sorted { $0.dueDate < $1.dueDate }
        for a in dueThisWeek {
            allTasks.append(StudyTask(
                priority: .dueThisWeek,
                icon: a.type.icon,
                title: "\(a.code): \(a.title)",
                subtitle: "Due \(a.dueLabel) \u{2022} \(a.points) pts",
                estimatedMinutes: estimatedTime(for: a.type),
                action: .assignment(a.id),
                urgencyColor: .yellow
            ))
        }

        // ── 3. Incomplete lessons for current week ──
        let currentWeekLessons = CourseContent.lessons.filter { $0.weekNumber == currentWeek }
        for lesson in currentWeekLessons {
            if !progress.isLessonComplete(lesson.id) {
                allTasks.append(StudyTask(
                    priority: .incompleteLessons,
                    icon: "book.closed.fill",
                    title: "Review: \(lesson.title)",
                    subtitle: "Lesson \(lesson.classNumber) \u{2022} Not yet completed",
                    estimatedMinutes: max(10, lesson.sections.count * 8),
                    action: .lesson(lesson.id),
                    urgencyColor: .blue
                ))
            }
        }

        // Also check previous weeks for incomplete lessons
        let previousWeekLessons = CourseContent.lessons.filter { $0.weekNumber < currentWeek }
        for lesson in previousWeekLessons {
            if !progress.isLessonComplete(lesson.id) {
                allTasks.append(StudyTask(
                    priority: .incompleteLessons,
                    icon: "book.closed.fill",
                    title: "Catch Up: \(lesson.title)",
                    subtitle: "Week \(lesson.weekNumber) \u{2022} Still incomplete",
                    estimatedMinutes: max(10, lesson.sections.count * 8),
                    action: .lesson(lesson.id),
                    urgencyColor: .blue
                ))
            }
        }

        // ── 4. Due flashcards ──
        for deck in progress.flashcardDecks {
            let dueCount = progress.dueCards(in: deck.id).count
            if dueCount > 0 {
                allTasks.append(StudyTask(
                    priority: .dueFlashcards,
                    icon: "rectangle.on.rectangle.angled",
                    title: "Flashcards: \(deck.title)",
                    subtitle: "\(dueCount) card\(dueCount == 1 ? "" : "s") due for review",
                    estimatedMinutes: max(2, dueCount),  // ~1 min per card
                    action: .flashcardDeck(deck.id),
                    urgencyColor: .orange
                ))
            }
        }

        // ── 5. Low quiz scores to retake ──
        let allQuizzes = CourseContent.quizzes + CourseContent.practiceExams
        for quiz in allQuizzes {
            if let best = progress.bestScore(for: quiz.id), best < 80 {
                let weakCategories = weakCategoriesForQuiz(quiz, progress: progress)
                let weakLabel = weakCategories.isEmpty
                    ? "Score: \(Int(best))%"
                    : "Weak: \(weakCategories.joined(separator: ", ")) (\(Int(best))%)"
                allTasks.append(StudyTask(
                    priority: .lowQuizScores,
                    icon: "arrow.counterclockwise.circle.fill",
                    title: "Retake: \(quiz.title)",
                    subtitle: weakLabel,
                    estimatedMinutes: max(5, quiz.questionCount * 2),
                    action: .quiz(quiz.id),
                    urgencyColor: .purple
                ))
            }
        }

        // ── 6. Upcoming quiz/midterm prep ──
        let upcomingExams = AssignmentData.allAssignments.filter {
            ($0.type == .quiz || $0.type == .midterm) &&
            $0.daysUntilDue > 0 && $0.daysUntilDue <= 7 &&
            !progress.isAssignmentComplete($0.id)
        }.sorted { $0.dueDate < $1.dueDate }

        for exam in upcomingExams {
            // Don't duplicate if already in due-tomorrow / due-this-week
            let alreadyAdded = allTasks.contains { task in
                if case .assignment(let id) = task.action, id == exam.id { return true }
                return false
            }
            if !alreadyAdded {
                let daysLeft = exam.daysUntilDue
                allTasks.append(StudyTask(
                    priority: .upcomingExamPrep,
                    icon: exam.type == .midterm ? "doc.on.clipboard.fill" : "checkmark.circle.fill",
                    title: "\(exam.type == .midterm ? "Midterm" : "Quiz") Prep: \(exam.code)",
                    subtitle: "\(daysLeft) day\(daysLeft == 1 ? "" : "s") away \u{2022} \(exam.points) pts",
                    estimatedMinutes: exam.type == .midterm ? 60 : 30,
                    action: .assignment(exam.id),
                    urgencyColor: exam.type == .midterm ? .red : .green
                ))
            }
        }

        // Sort by priority, then by estimated time (shorter first within same priority)
        allTasks.sort {
            if $0.priority != $1.priority {
                return $0.priority < $1.priority
            }
            return $0.estimatedMinutes < $1.estimatedMinutes
        }

        tasks = allTasks
        totalEstimatedMinutes = allTasks.reduce(0) { $0 + $1.estimatedMinutes }
    }

    private func estimatedTime(for type: Assignment.AssignmentType) -> Int {
        switch type {
        case .preLecture: return 15
        case .homework: return 30
        case .quiz: return 20
        case .midterm: return 60
        case .lectureActivity: return 10
        }
    }

    private func weakCategoriesForQuiz(_ quiz: Quiz, progress: ProgressManager) -> [String] {
        // Find the latest attempt for this quiz
        let attempts = progress.quizAttempts.filter { $0.quizId == quiz.id }
        guard let latest = attempts.sorted(by: { $0.date < $1.date }).last else { return [] }

        // Tally correct/total per category
        var categoryScores: [QuizQuestion.QuestionCategory: (correct: Int, total: Int)] = [:]
        for (index, question) in quiz.questions.enumerated() {
            guard index < latest.answers.count else { continue }
            let isCorrect = latest.answers[index] == question.correctIndex
            let existing = categoryScores[question.category] ?? (0, 0)
            categoryScores[question.category] = (existing.correct + (isCorrect ? 1 : 0), existing.total + 1)
        }

        // Return categories under 60%
        return categoryScores.compactMap { cat, score in
            let pct = score.total > 0 ? Double(score.correct) / Double(score.total) * 100 : 0
            return pct < 60 ? "\(cat.rawValue.capitalized) \(Int(pct))%" : nil
        }
    }
}

// MARK: - Study Plan View

struct StudyPlanView: View {
    @EnvironmentObject var progress: ProgressManager
    @Binding var selectedTab: Int
    @StateObject private var generator = StudyPlanGenerator()
    @State private var navigateToLesson: String?
    @State private var navigateToQuiz: String?
    @State private var navigateToFlashcardDeck: String?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    headerSection
                    if generator.tasks.isEmpty {
                        allCaughtUpSection
                    } else {
                        startStudyingButton
                        taskListSection
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Study Plan")
            .onAppear {
                generator.generate(progress: progress)
            }
            .onChange(of: progress.completedAssignments) { _ in
                generator.generate(progress: progress)
            }
            .navigationDestination(item: $navigateToLesson) { lessonId in
                if let lesson = CourseContent.lessons.first(where: { $0.id == lessonId }) {
                    LessonDetailView(lesson: lesson)
                }
            }
            .navigationDestination(item: $navigateToQuiz) { quizId in
                let allQuizzes = CourseContent.quizzes + CourseContent.practiceExams
                if let quiz = allQuizzes.first(where: { $0.id == quizId }) {
                    QuizView(quiz: quiz)
                }
            }
            .navigationDestination(item: $navigateToFlashcardDeck) { deckId in
                FlashcardStudyView(deckId: deckId)
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Today's Study Plan")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(dateString)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()

                if !generator.tasks.isEmpty {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("\(generator.tasks.count)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Text("tasks")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }

            if !generator.tasks.isEmpty {
                HStack(spacing: 16) {
                    Label("\(formatTime(generator.totalEstimatedMinutes))", systemImage: "clock.fill")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    let urgentCount = generator.tasks.filter { $0.priority <= .dueTomorrow }.count
                    if urgentCount > 0 {
                        Label("\(urgentCount) urgent", systemImage: "exclamationmark.triangle.fill")
                            .font(.subheadline)
                            .foregroundColor(.red)
                    }

                    let dueCards = totalDueFlashcards
                    if dueCards > 0 {
                        Label("\(dueCards) cards due", systemImage: "rectangle.on.rectangle.angled")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                    }

                    Spacer()
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - All Caught Up

    private var allCaughtUpSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)

            Text("You're All Caught Up!")
                .font(.title3)
                .fontWeight(.bold)

            Text("No urgent tasks right now. Keep up the great work! Check back later or review past material to stay sharp.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button {
                selectedTab = 2 // Lessons
            } label: {
                Label("Browse Lessons", systemImage: "book.fill")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Capsule().fill(Color.blue))
                    .foregroundColor(.white)
            }
        }
        .padding(32)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - Start Studying Button

    private var startStudyingButton: some View {
        Button {
            handleTaskAction(generator.tasks.first!)
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "play.circle.fill")
                    .font(.title2)

                VStack(alignment: .leading, spacing: 2) {
                    Text("Start Studying")
                        .font(.headline)
                    if let first = generator.tasks.first {
                        Text(first.title)
                            .font(.caption)
                            .opacity(0.8)
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [.blue, .blue.opacity(0.8)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(color: .blue.opacity(0.3), radius: 8, y: 4)
            )
            .foregroundColor(.white)
        }
    }

    // MARK: - Task List

    private var taskListSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Group by priority category
            let grouped = Dictionary(grouping: generator.tasks) { $0.priority }
            let sortedKeys = grouped.keys.sorted()

            ForEach(sortedKeys, id: \.self) { priority in
                if let tasks = grouped[priority] {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(sectionTitle(for: priority))
                            .font(.headline)
                            .foregroundColor(sectionColor(for: priority))
                            .padding(.top, 4)

                        ForEach(tasks) { task in
                            StudyTaskRow(task: task) {
                                handleTaskAction(task)
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: - Helpers

    private func handleTaskAction(_ task: StudyTask) {
        switch task.action {
        case .lesson(let id):
            navigateToLesson = id
        case .quiz(let id):
            navigateToQuiz = id
        case .flashcardDeck(let id):
            navigateToFlashcardDeck = id
        case .assignment(let id):
            // Find the assignment type and navigate accordingly
            if let assignment = AssignmentData.allAssignments.first(where: { $0.id == id }) {
                switch assignment.type {
                case .quiz, .midterm:
                    selectedTab = 3
                case .preLecture:
                    selectedTab = 2
                case .homework:
                    selectedTab = 1
                case .lectureActivity:
                    selectedTab = 1
                }
            }
        case .tab(let index):
            selectedTab = index
        }
    }

    private var totalDueFlashcards: Int {
        progress.flashcardDecks.reduce(0) { $0 + progress.dueCards(in: $1.id).count }
    }

    private var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: Date())
    }

    private func formatTime(_ minutes: Int) -> String {
        if minutes >= 60 {
            let h = minutes / 60
            let m = minutes % 60
            return m > 0 ? "\(h)h \(m)m" : "\(h)h"
        }
        return "\(minutes) min"
    }

    private func sectionTitle(for priority: StudyTask.TaskPriority) -> String {
        switch priority {
        case .pastDue: return "Overdue"
        case .dueTomorrow: return "Due Soon"
        case .dueThisWeek: return "This Week"
        case .incompleteLessons: return "Lessons to Complete"
        case .dueFlashcards: return "Flashcard Review"
        case .lowQuizScores: return "Quiz Retakes"
        case .upcomingExamPrep: return "Exam Prep"
        }
    }

    private func sectionColor(for priority: StudyTask.TaskPriority) -> Color {
        switch priority {
        case .pastDue: return .red
        case .dueTomorrow: return .orange
        case .dueThisWeek: return .yellow
        case .incompleteLessons: return .blue
        case .dueFlashcards: return .orange
        case .lowQuizScores: return .purple
        case .upcomingExamPrep: return .green
        }
    }
}

// MARK: - Study Task Row

struct StudyTaskRow: View {
    let task: StudyTask
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                // Priority indicator
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(task.urgencyColor.opacity(0.15))
                        .frame(width: 44, height: 44)

                    Image(systemName: task.icon)
                        .font(.body)
                        .foregroundColor(task.urgencyColor)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(task.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(1)

                    Text(task.subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("~\(task.estimatedMinutes)m")
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Capsule().fill(Color(.systemGray6)))

                    Image(systemName: "chevron.right")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(
                        task.priority <= .dueTomorrow
                            ? task.urgencyColor.opacity(0.3)
                            : Color.clear,
                        lineWidth: 1
                    )
            )
        }
    }
}

// MARK: - Home View Study Plan Card (Compact)

struct StudyPlanCard: View {
    @EnvironmentObject var progress: ProgressManager
    @Binding var selectedTab: Int
    @StateObject private var generator = StudyPlanGenerator()
    @State private var showFullPlan = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "brain.head.profile")
                    .font(.title3)
                    .foregroundColor(.indigo)
                Text("Study Plan")
                    .font(.headline)
                Spacer()
                NavigationLink {
                    StudyPlanView(selectedTab: $selectedTab)
                } label: {
                    Text("See Full Plan")
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }

            if generator.tasks.isEmpty {
                HStack(spacing: 10) {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                    Text("You're all caught up! No urgent study tasks.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            } else {
                // Summary line
                HStack(spacing: 12) {
                    Label(formatTime(generator.totalEstimatedMinutes), systemImage: "clock.fill")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    let urgentCount = generator.tasks.filter { $0.priority <= .dueTomorrow }.count
                    if urgentCount > 0 {
                        Label("\(urgentCount) urgent", systemImage: "exclamationmark.triangle.fill")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                    Spacer()
                }

                // Top 3 priorities
                ForEach(Array(generator.tasks.prefix(3))) { task in
                    StudyPlanCardRow(task: task)
                }

                if generator.tasks.count > 3 {
                    Text("+\(generator.tasks.count - 3) more tasks")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 2)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
        .onAppear {
            generator.generate(progress: progress)
        }
        .onChange(of: progress.completedAssignments) { _ in
            generator.generate(progress: progress)
        }
    }

    private func formatTime(_ minutes: Int) -> String {
        if minutes >= 60 {
            let h = minutes / 60
            let m = minutes % 60
            return m > 0 ? "\(h)h \(m)m" : "\(h)h"
        }
        return "\(minutes) min"
    }
}

struct StudyPlanCardRow: View {
    let task: StudyTask

    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(task.urgencyColor)
                .frame(width: 8, height: 8)

            Image(systemName: task.icon)
                .font(.caption)
                .foregroundColor(task.urgencyColor)
                .frame(width: 20)

            VStack(alignment: .leading, spacing: 1) {
                Text(task.title)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(task.subtitle)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            Text("~\(task.estimatedMinutes)m")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - String extension for navigationDestination(item:)

extension String: @retroactive Identifiable {
    public var id: String { self }
}

#Preview {
    StudyPlanView(selectedTab: .constant(0))
        .environmentObject(ProgressManager())
}
