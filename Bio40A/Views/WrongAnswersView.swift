import SwiftUI

struct WrongAnswersView: View {
    @EnvironmentObject var progress: ProgressManager
    @State private var showRetryQuiz = false

    private var wrongAnswers: [ProgressManager.WrongAnswer] {
        progress.wrongAnswers
    }

    private var byCategory: [QuizQuestion.QuestionCategory: [ProgressManager.WrongAnswer]] {
        progress.wrongAnswersByCategory
    }

    private let categoryOrder: [QuizQuestion.QuestionCategory] = [
        .recall, .application, .analysis, .clinical
    ]

    var body: some View {
        Group {
            if wrongAnswers.isEmpty {
                emptyState
            } else {
                wrongAnswersList
            }
        }
        .navigationTitle("Wrong Answers")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "star.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.yellow)

            Text("Perfect Scores!")
                .font(.title2)
                .fontWeight(.bold)

            Text("Nothing to review.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }

    // MARK: - Wrong Answers List

    private var wrongAnswersList: some View {
        ScrollView {
            VStack(spacing: 20) {
                summaryCard
                retryButton

                ForEach(categoryOrder, id: \.rawValue) { category in
                    if let items = byCategory[category], !items.isEmpty {
                        categorySection(category: category, items: items)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationDestination(isPresented: $showRetryQuiz) {
            if let quiz = progress.generateWrongAnswersQuiz() {
                QuizView(quiz: quiz)
            }
        }
    }

    // MARK: - Summary Card

    private var summaryCard: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                Text("\(wrongAnswers.count) Wrong Answer\(wrongAnswers.count == 1 ? "" : "s")")
                    .font(.headline)
                Spacer()
            }

            // Breakdown by category
            HStack(spacing: 16) {
                ForEach(categoryOrder, id: \.rawValue) { category in
                    let count = byCategory[category]?.count ?? 0
                    if count > 0 {
                        VStack(spacing: 4) {
                            Text("\(count)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(colorForCategory(category))
                            Text(displayName(for: category))
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                    }
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

    // MARK: - Retry Button

    private var retryButton: some View {
        Button {
            showRetryQuiz = true
        } label: {
            HStack {
                Image(systemName: "arrow.counterclockwise.circle.fill")
                Text("Retry Wrong Questions")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.blue)
            )
            .foregroundColor(.white)
        }
    }

    // MARK: - Category Section

    private func categorySection(category: QuizQuestion.QuestionCategory, items: [ProgressManager.WrongAnswer]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Circle()
                    .fill(colorForCategory(category))
                    .frame(width: 10, height: 10)

                Text(displayName(for: category))
                    .font(.headline)
                    .foregroundColor(colorForCategory(category))

                Text("(\(items.count))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()
            }

            ForEach(items) { item in
                wrongAnswerCard(item)
            }
        }
    }

    // MARK: - Wrong Answer Card

    private func wrongAnswerCard(_ item: ProgressManager.WrongAnswer) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            // Question
            Text(item.question.question)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineSpacing(3)

            // User's wrong answer
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.top, 2)

                Text(item.userAnswerText)
                    .font(.caption)
                    .foregroundColor(.red)
            }
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.red.opacity(0.08))
            )

            // Correct answer
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.caption)
                    .padding(.top, 2)

                Text(item.correctAnswerText)
                    .font(.caption)
                    .foregroundColor(.green)
            }
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.green.opacity(0.08))
            )

            // Explanation
            VStack(alignment: .leading, spacing: 4) {
                Label("Explanation", systemImage: "lightbulb.fill")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)

                Text(item.question.explanation)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineSpacing(2)
            }
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue.opacity(0.05))
            )

            // Quiz source
            HStack(spacing: 4) {
                Image(systemName: "doc.text")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text("From: \(item.quizTitle)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.04), radius: 6, y: 2)
        )
    }

    // MARK: - Helpers

    private func displayName(for category: QuizQuestion.QuestionCategory) -> String {
        switch category {
        case .recall: return "Recall"
        case .application: return "Application"
        case .analysis: return "Analysis"
        case .clinical: return "Clinical"
        }
    }

    private func colorForCategory(_ category: QuizQuestion.QuestionCategory) -> Color {
        switch category {
        case .recall: return .blue
        case .application: return .purple
        case .analysis: return .orange
        case .clinical: return .red
        }
    }
}

#Preview {
    NavigationStack {
        WrongAnswersView()
    }
    .environmentObject(ProgressManager())
}
