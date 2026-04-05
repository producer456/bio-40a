import SwiftUI

struct PracticeExamView: View {
    @EnvironmentObject var progress: ProgressManager
    @Environment(\.dismiss) private var dismiss

    let quiz: Quiz

    @State private var currentIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var answers: [Int] = []
    @State private var correctCount = 0
    @State private var isFinished = false
    @State private var startTime = Date()
    @State private var finishedTime: TimeInterval = 0
    @State private var showReviewWrong = false

    // Timer state
    @State private var timeRemaining: Int
    @State private var timerActive = true
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(quiz: Quiz) {
        self.quiz = quiz
        _timeRemaining = State(initialValue: quiz.timeLimit ?? 6600)
    }

    private var currentQuestion: QuizQuestion {
        quiz.questions[currentIndex]
    }

    private var progressFraction: Double {
        guard quiz.questionCount > 0 else { return 0 }
        return Double(currentIndex) / Double(quiz.questionCount)
    }

    private var timerColor: Color {
        if timeRemaining <= 300 { return .red }
        if timeRemaining <= 600 { return .orange }
        return .primary
    }

    private var timerText: String {
        let hours = timeRemaining / 3600
        let minutes = (timeRemaining % 3600) / 60
        let seconds = timeRemaining % 60
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        }
        return String(format: "%d:%02d", minutes, seconds)
    }

    var body: some View {
        VStack(spacing: 0) {
            if isFinished {
                scoreView
            } else {
                examView
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(quiz.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if isFinished {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                }
            } else {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("End Exam") {
                        finishExam()
                    }
                    .foregroundColor(.red)
                    .font(.subheadline)
                }
            }
        }
        .onReceive(timer) { _ in
            guard timerActive && !isFinished else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                finishExam()
            }
        }
    }

    // MARK: - Exam View

    private var examView: some View {
        VStack(spacing: 0) {
            // Timer bar
            timerBar

            // Progress bar
            progressBar

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Question counter
                    Text("Question \(currentIndex + 1) of \(quiz.questionCount)")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)

                    // Difficulty badge
                    HStack(spacing: 6) {
                        difficultyBadge(currentQuestion.difficulty)
                        categoryBadge(currentQuestion.category)
                    }

                    // Question text
                    Text(currentQuestion.question)
                        .font(.body)
                        .fontWeight(.medium)
                        .lineSpacing(4)

                    // Answer choices
                    VStack(spacing: 10) {
                        ForEach(Array(currentQuestion.choices.enumerated()), id: \.offset) { index, choice in
                            answerButton(index: index, text: choice)
                        }
                    }

                    // Next button (only shown after selecting an answer)
                    if selectedAnswer != nil {
                        nextButton
                    }
                }
                .padding()
            }
        }
    }

    private var timerBar: some View {
        HStack {
            Image(systemName: "clock.fill")
                .font(.subheadline)
                .foregroundColor(timerColor)

            Text(timerText)
                .font(.system(.subheadline, design: .monospaced))
                .fontWeight(.semibold)
                .foregroundColor(timerColor)

            Spacer()

            Text("\(currentIndex + 1) / \(quiz.questionCount)")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            timeRemaining <= 300
                ? Color.red.opacity(0.08)
                : Color(.systemBackground)
        )
        .animation(.easeInOut, value: timeRemaining <= 300)
    }

    private var progressBar: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.indigo.opacity(0.15))
                    .frame(height: 4)

                Rectangle()
                    .fill(Color.indigo)
                    .frame(width: geo.size.width * progressFraction, height: 4)
                    .animation(.easeInOut, value: currentIndex)
            }
        }
        .frame(height: 4)
    }

    private func difficultyBadge(_ difficulty: QuizQuestion.Difficulty) -> some View {
        let (text, color): (String, Color) = {
            switch difficulty {
            case .easy: return ("Easy", .green)
            case .medium: return ("Medium", .orange)
            case .hard: return ("Hard", .red)
            }
        }()
        return Text(text)
            .font(.caption2)
            .fontWeight(.semibold)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(color.opacity(0.15))
            .foregroundColor(color)
            .clipShape(Capsule())
    }

    private func categoryBadge(_ category: QuizQuestion.QuestionCategory) -> some View {
        let (text, icon): (String, String) = {
            switch category {
            case .recall: return ("Recall", "brain.head.profile")
            case .application: return ("Application", "gearshape.2")
            case .analysis: return ("Analysis", "chart.bar.xaxis")
            case .clinical: return ("Clinical", "cross.case")
            }
        }()
        return Label(text, systemImage: icon)
            .font(.caption2)
            .fontWeight(.medium)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(Color.indigo.opacity(0.1))
            .foregroundColor(.indigo)
            .clipShape(Capsule())
    }

    private func answerButton(index: Int, text: String) -> some View {
        let letters = ["A", "B", "C", "D"]
        let isSelected = selectedAnswer == index

        return Button {
            guard selectedAnswer == nil else { return }
            selectedAnswer = index
            answers.append(index)
            if index == currentQuestion.correctIndex {
                correctCount += 1
            }
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(isSelected ? Color.indigo : Color.indigo.opacity(0.1))
                        .frame(width: 34, height: 34)

                    Text(index < letters.count ? letters[index] : "")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(isSelected ? .white : .indigo)
                }

                Text(text)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(2)

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.indigo)
                }
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.indigo.opacity(0.08) : Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.indigo : Color.gray.opacity(0.2), lineWidth: isSelected ? 2 : 1)
                    )
            )
        }
        .disabled(selectedAnswer != nil)
    }

    private var nextButton: some View {
        Button {
            if currentIndex < quiz.questionCount - 1 {
                withAnimation {
                    currentIndex += 1
                    selectedAnswer = nil
                }
            } else {
                finishExam()
            }
        } label: {
            HStack {
                Text(currentIndex < quiz.questionCount - 1 ? "Next Question" : "Submit Exam")
                    .fontWeight(.semibold)
                Image(systemName: currentIndex < quiz.questionCount - 1 ? "arrow.right" : "paperplane.fill")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.indigo)
            )
            .foregroundColor(.white)
        }
        .padding(.top, 8)
    }

    // MARK: - Score View

    private var scoreView: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.system(size: 40))
                        .foregroundColor(.indigo)

                    Text("Exam Complete")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .padding(.top, 12)

                // Score circle
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.15), lineWidth: 14)
                        .frame(width: 170, height: 170)

                    Circle()
                        .trim(from: 0, to: CGFloat(correctCount) / CGFloat(quiz.questionCount))
                        .stroke(scoreColor, style: StrokeStyle(lineWidth: 14, lineCap: .round))
                        .frame(width: 170, height: 170)
                        .rotationEffect(.degrees(-90))

                    VStack(spacing: 4) {
                        Text(String(format: "%.0f%%", scorePercentage))
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(scoreColor)

                        Text("\(correctCount)/\(quiz.questionCount)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }

                // Message
                Text(scoreMessage)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)

                // Stats grid
                statsGrid

                // Category breakdown
                categoryBreakdown

                // Review wrong answers
                if correctCount < quiz.questionCount {
                    Button {
                        withAnimation {
                            showReviewWrong.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "exclamationmark.triangle")
                            Text(showReviewWrong ? "Hide Wrong Answers" : "Review Wrong Answers (\(quiz.questionCount - correctCount))")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .foregroundColor(.red)
                    }

                    if showReviewWrong {
                        wrongAnswersReview
                    }
                }

                // Retake button
                Button {
                    resetExam()
                } label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Retake Exam")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.indigo)
                    )
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }

    private var statsGrid: some View {
        HStack(spacing: 16) {
            statCard(icon: "clock.fill", iconColor: .blue, value: timeSpentFormatted, label: "Time Used")
            statCard(icon: "checkmark.circle.fill", iconColor: .green, value: "\(correctCount)", label: "Correct")
            statCard(icon: "xmark.circle.fill", iconColor: .red, value: "\(quiz.questionCount - correctCount)", label: "Wrong")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    private func statCard(icon: String, iconColor: Color, value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundColor(iconColor)
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
            Text(label)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }

    private var categoryBreakdown: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Performance by Category")
                .font(.subheadline)
                .fontWeight(.semibold)

            ForEach(categoryStats, id: \.category) { stat in
                HStack(spacing: 12) {
                    Image(systemName: stat.icon)
                        .font(.caption)
                        .foregroundColor(.indigo)
                        .frame(width: 20)

                    Text(stat.category)
                        .font(.subheadline)
                        .frame(width: 90, alignment: .leading)

                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.gray.opacity(0.15))
                                .frame(height: 8)

                            RoundedRectangle(cornerRadius: 4)
                                .fill(stat.percentage >= 70 ? Color.green : (stat.percentage >= 50 ? Color.orange : Color.red))
                                .frame(width: max(0, geo.size.width * CGFloat(stat.percentage / 100)), height: 8)
                        }
                    }
                    .frame(height: 8)

                    Text("\(stat.correct)/\(stat.total)")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .frame(width: 36, alignment: .trailing)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    private var wrongAnswersReview: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(Array(quiz.questions.enumerated()), id: \.offset) { index, question in
                if index < answers.count && answers[index] != question.correctIndex {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Q\(index + 1): \(question.question)")
                            .font(.subheadline)
                            .fontWeight(.medium)

                        HStack(spacing: 6) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .font(.caption)
                            Text("Your answer: \(question.choices[answers[index]])")
                                .font(.caption)
                                .foregroundColor(.red)
                        }

                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.caption)
                            Text("Correct: \(question.choices[question.correctIndex])")
                                .font(.caption)
                                .foregroundColor(.green)
                        }

                        Text(question.explanation)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineSpacing(2)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                }
            }
        }
        .transition(.opacity)
    }

    // MARK: - Category Stats

    private struct CategoryStat {
        let category: String
        let icon: String
        let correct: Int
        let total: Int
        var percentage: Double {
            guard total > 0 else { return 0 }
            return Double(correct) / Double(total) * 100
        }
    }

    private var categoryStats: [CategoryStat] {
        let categories: [(QuizQuestion.QuestionCategory, String, String)] = [
            (.recall, "Recall", "brain.head.profile"),
            (.application, "Application", "gearshape.2"),
            (.analysis, "Analysis", "chart.bar.xaxis"),
            (.clinical, "Clinical", "cross.case")
        ]

        return categories.compactMap { cat, name, icon in
            let questionsInCategory = quiz.questions.enumerated().filter { $0.element.category == cat }
            guard !questionsInCategory.isEmpty else { return nil }
            let correctInCategory = questionsInCategory.filter { index, question in
                index < answers.count && answers[index] == question.correctIndex
            }.count
            return CategoryStat(category: name, icon: icon, correct: correctInCategory, total: questionsInCategory.count)
        }
    }

    // MARK: - Helpers

    private var scorePercentage: Double {
        guard quiz.questionCount > 0 else { return 0 }
        return Double(correctCount) / Double(quiz.questionCount) * 100
    }

    private var scoreColor: Color {
        if scorePercentage >= 90 { return .green }
        if scorePercentage >= 70 { return .blue }
        if scorePercentage >= 50 { return .orange }
        return .red
    }

    private var scoreMessage: String {
        if scorePercentage >= 90 { return "Outstanding! You are exam-ready." }
        if scorePercentage >= 80 { return "Great job! Just a few areas to review." }
        if scorePercentage >= 70 { return "Passing score. Keep studying weak areas." }
        if scorePercentage >= 60 { return "Close to passing. Focus on the categories below." }
        return "Needs more study. Review all lessons before the exam."
    }

    private var timeSpentFormatted: String {
        let elapsed = Int(finishedTime)
        let hours = elapsed / 3600
        let minutes = (elapsed % 3600) / 60
        let seconds = elapsed % 60
        if hours > 0 {
            return String(format: "%d:%02d:%02d", hours, minutes, seconds)
        }
        return String(format: "%d:%02d", minutes, seconds)
    }

    private func finishExam() {
        timerActive = false
        let elapsed = Date().timeIntervalSince(startTime)
        finishedTime = elapsed

        // Fill in unanswered questions as -1 (wrong)
        while answers.count < quiz.questionCount {
            answers.append(-1)
        }

        let attempt = QuizAttempt(
            id: UUID().uuidString,
            quizId: quiz.id,
            date: Date(),
            answers: answers,
            score: correctCount,
            totalQuestions: quiz.questionCount,
            timeSpent: elapsed
        )
        progress.recordQuizAttempt(attempt, weekNumber: quiz.weekNumber)
        progress.addStudyTime(elapsed, weekNumber: quiz.weekNumber)

        withAnimation {
            isFinished = true
        }
    }

    private func resetExam() {
        currentIndex = 0
        selectedAnswer = nil
        answers = []
        correctCount = 0
        isFinished = false
        showReviewWrong = false
        startTime = Date()
        finishedTime = 0
        timeRemaining = quiz.timeLimit ?? 6600
        timerActive = true
    }
}

#Preview {
    NavigationStack {
        PracticeExamView(quiz: CourseContent.practiceExams[0])
    }
    .environmentObject(ProgressManager())
}
