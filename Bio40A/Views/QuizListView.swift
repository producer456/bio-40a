import SwiftUI

struct QuizListView: View {
    @EnvironmentObject var progress: ProgressManager
    @State private var lockedAlertWeek: Int?
    @State private var showLockedAlert = false

    private var quizzes: [Quiz] { CourseContent.quizzes }
    private var practiceExams: [Quiz] { CourseContent.practiceExams }

    var body: some View {
        NavigationStack {
            Group {
                if quizzes.isEmpty && practiceExams.isEmpty {
                    emptyState
                } else {
                    quizList
                }
            }
            .navigationTitle("Quizzes")
            .background(Color(.systemGroupedBackground))
            .alert("Content Locked", isPresented: $showLockedAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                if let week = lockedAlertWeek {
                    Text("This quiz unlocks in Week \(week) (\(ContentUnlockManager.unlockDateString(for: week)))")
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 50))
                .foregroundColor(.green.opacity(0.5))
            Text("No Quizzes Available")
                .font(.title3)
                .fontWeight(.medium)
            Text("Quizzes will appear here once course content is loaded.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(40)
    }

    private var quizList: some View {
        List {
            // Practice Exams Section — always unlocked (weekNumber 0)
            if !practiceExams.isEmpty {
                Section {
                    ForEach(practiceExams) { exam in
                        NavigationLink(destination: PracticeExamView(quiz: exam)) {
                            PracticeExamRow(quiz: exam, bestScore: progress.bestScore(for: exam.id))
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                    }
                } header: {
                    Label("Practice Exams", systemImage: "doc.text.magnifyingglass")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.indigo)
                        .textCase(nil)
                }
            }

            if !progress.wrongAnswers.isEmpty {
                Section {
                    NavigationLink(destination: WrongAnswersView()) {
                        HStack(spacing: 14) {
                            ZStack {
                                Circle()
                                    .fill(Color.red.opacity(0.15))
                                    .frame(width: 48, height: 48)

                                Image(systemName: "xmark.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(.red)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text("Wrong Answers")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                                Text("\(progress.wrongAnswers.count) question\(progress.wrongAnswers.count == 1 ? "" : "s") to review")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                        }
                        .padding(.vertical, 6)
                    }
                }
            }

            Section {
                ForEach(quizzes) { quiz in
                    let unlocked = ContentUnlockManager.isUnlocked(quiz.weekNumber)
                    if unlocked {
                        NavigationLink(destination: QuizView(quiz: quiz)) {
                            QuizRow(quiz: quiz, bestScore: progress.bestScore(for: quiz.id), isLocked: false)
                        }
                    } else {
                        Button {
                            lockedAlertWeek = quiz.weekNumber
                            showLockedAlert = true
                        } label: {
                            QuizRow(quiz: quiz, bestScore: nil, isLocked: true)
                        }
                        .buttonStyle(.plain)
                    }
                }
            } header: {
                if !practiceExams.isEmpty {
                    Label("Weekly Quizzes", systemImage: "list.bullet.clipboard")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .textCase(nil)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

// MARK: - Quiz Row

struct QuizRow: View {
    let quiz: Quiz
    let bestScore: Double?
    var isLocked: Bool = false

    var body: some View {
        HStack(spacing: 14) {
            // Score indicator
            ZStack {
                Circle()
                    .fill(isLocked ? Color.gray.opacity(0.15) : scoreColor.opacity(0.15))
                    .frame(width: 48, height: 48)

                if isLocked {
                    Image(systemName: "lock.fill")
                        .font(.title3)
                        .foregroundColor(.gray)
                } else if let score = bestScore {
                    Text(String(format: "%.0f", score))
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(scoreColor)
                } else {
                    Image(systemName: "questionmark")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(quiz.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(isLocked ? .secondary : .primary)

                HStack(spacing: 12) {
                    Label("\(quiz.questionCount) questions", systemImage: "list.bullet")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    if let time = quiz.timeLimit {
                        Label("\(time / 60) min", systemImage: "clock")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }

                if !isLocked, let score = bestScore {
                    HStack(spacing: 4) {
                        Image(systemName: "trophy.fill")
                            .font(.caption2)
                            .foregroundColor(.yellow)
                        Text("Best: \(String(format: "%.0f%%", score))")
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(scoreColor)
                    }
                }
            }

            Spacer()

            if isLocked {
                Image(systemName: "lock.fill")
                    .font(.caption)
                    .foregroundColor(.secondary)
            } else {
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 6)
        .opacity(isLocked ? 0.6 : 1.0)
    }

    private var scoreColor: Color {
        guard let score = bestScore else { return .gray }
        if score >= 90 { return .green }
        if score >= 70 { return .blue }
        if score >= 50 { return .orange }
        return .red
    }
}

// MARK: - Practice Exam Row

struct PracticeExamRow: View {
    let quiz: Quiz
    let bestScore: Double?

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 14) {
                // Icon with gradient background
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [.indigo, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 48, height: 48)

                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.title3)
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(quiz.title)
                        .font(.subheadline)
                        .fontWeight(.bold)

                    HStack(spacing: 12) {
                        Label("\(quiz.questionCount) questions", systemImage: "list.number")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        if let time = quiz.timeLimit {
                            Label("\(time / 60) min", systemImage: "timer")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }

                    if let score = bestScore {
                        HStack(spacing: 4) {
                            Image(systemName: "trophy.fill")
                                .font(.caption2)
                                .foregroundColor(.yellow)
                            Text("Best: \(String(format: "%.0f%%", score))")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundColor(examScoreColor)
                        }
                    } else {
                        Text("Not attempted yet")
                            .font(.caption)
                            .foregroundColor(.indigo.opacity(0.7))
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.indigo)
            }
            .padding(14)
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(
                            LinearGradient(
                                colors: [.indigo.opacity(0.4), .purple.opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1.5
                        )
                )
                .shadow(color: .indigo.opacity(0.1), radius: 6, y: 3)
        )
    }

    private var examScoreColor: Color {
        guard let score = bestScore else { return .gray }
        if score >= 90 { return .green }
        if score >= 70 { return .blue }
        if score >= 50 { return .orange }
        return .red
    }
}

#Preview {
    QuizListView()
        .environmentObject(ProgressManager())
}
