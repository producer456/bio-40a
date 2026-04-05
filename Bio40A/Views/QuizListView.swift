import SwiftUI

struct QuizListView: View {
    @EnvironmentObject var progress: ProgressManager

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
            // Practice Exams Section
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
                    NavigationLink(destination: QuizView(quiz: quiz)) {
                        QuizRow(quiz: quiz, bestScore: progress.bestScore(for: quiz.id))
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

    var body: some View {
        HStack(spacing: 14) {
            // Score indicator
            ZStack {
                Circle()
                    .fill(scoreColor.opacity(0.15))
                    .frame(width: 48, height: 48)

                if let score = bestScore {
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

                if let score = bestScore {
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

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 6)
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
