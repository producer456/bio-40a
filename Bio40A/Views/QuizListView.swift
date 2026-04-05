import SwiftUI

struct QuizListView: View {
    @EnvironmentObject var progress: ProgressManager

    private var quizzes: [Quiz] { CourseContent.quizzes }

    var body: some View {
        NavigationStack {
            Group {
                if quizzes.isEmpty {
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
            ForEach(quizzes) { quiz in
                NavigationLink(destination: QuizView(quiz: quiz)) {
                    QuizRow(quiz: quiz, bestScore: progress.bestScore(for: quiz.id))
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

#Preview {
    QuizListView()
        .environmentObject(ProgressManager())
}
