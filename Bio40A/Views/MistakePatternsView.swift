import SwiftUI

struct MistakePatternsView: View {
    @EnvironmentObject var progress: ProgressManager
    @State private var practiceQuiz: Quiz? = nil
    @State private var showPracticeQuiz = false

    private var patterns: [ProgressManager.MistakePattern] {
        progress.mistakePatterns
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if patterns.isEmpty {
                    emptyState
                } else {
                    headerSection
                    ForEach(patterns) { pattern in
                        patternCard(pattern)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mistake Patterns")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(isPresented: $showPracticeQuiz) {
            if let quiz = practiceQuiz {
                QuizView(quiz: quiz)
            }
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 16) {
            Spacer().frame(height: 60)

            Image(systemName: "brain.head.profile")
                .font(.system(size: 60))
                .foregroundColor(.secondary.opacity(0.5))

            Text("No Patterns Yet")
                .font(.title2)
                .fontWeight(.bold)

            Text("Keep taking quizzes to identify your mistake patterns. The analyzer will find concepts you frequently confuse.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)

            Spacer()
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Your Confusion Patterns")
                .font(.headline)

            Text("These are concepts you frequently mix up. Review the mnemonics and practice to strengthen your understanding.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - Pattern Card

    private func patternCard(_ pattern: ProgressManager.MistakePattern) -> some View {
        VStack(spacing: 0) {
            // Frequency indicator strip
            Rectangle()
                .fill(frequencyColor(pattern.occurrences).gradient)
                .frame(height: 4)

            VStack(alignment: .leading, spacing: 14) {
                // Confusion pair header
                HStack(spacing: 0) {
                    termBubble(pattern.confusedTermA, color: .blue)

                    Spacer()

                    VStack(spacing: 2) {
                        Image(systemName: "arrow.left.arrow.right")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Text("vs")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 44)

                    Spacer()

                    termBubble(pattern.confusedTermB, color: .orange)
                }

                // Occurrence count
                HStack(spacing: 6) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.caption)
                        .foregroundColor(frequencyColor(pattern.occurrences))

                    Text("Confused \(pattern.occurrences) time\(pattern.occurrences == 1 ? "" : "s")")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(frequencyColor(pattern.occurrences))
                }

                // Mnemonic / suggestion
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "lightbulb.fill")
                        .font(.body)
                        .foregroundColor(.yellow)
                        .frame(width: 24)

                    Text(pattern.suggestion)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.yellow.opacity(0.1))
                )

                // Practice button
                Button {
                    practiceQuiz = progress.generateMistakePatternQuiz(for: pattern)
                    if practiceQuiz != nil {
                        showPracticeQuiz = true
                    }
                } label: {
                    HStack {
                        Image(systemName: "dumbbell.fill")
                            .font(.subheadline)
                        Text("Practice This")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(frequencyColor(pattern.occurrences).opacity(0.15))
                    )
                    .foregroundColor(frequencyColor(pattern.occurrences))
                }
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    // MARK: - Term Bubble

    private func termBubble(_ term: String, color: Color) -> some View {
        Text(term)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(color)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .frame(minWidth: 100)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(color.opacity(0.3), lineWidth: 1)
                    )
            )
    }

    // MARK: - Helpers

    private func frequencyColor(_ count: Int) -> Color {
        if count >= 3 { return .red }
        if count == 2 { return .orange }
        return .yellow
    }
}

#Preview {
    NavigationStack {
        MistakePatternsView()
            .environmentObject(ProgressManager())
    }
}
