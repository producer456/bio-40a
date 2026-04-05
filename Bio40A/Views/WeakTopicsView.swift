import SwiftUI

struct WeakTopicsView: View {
    @EnvironmentObject var progress: ProgressManager
    @State private var showWeakQuiz = false
    @State private var weakQuiz: Quiz?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerSection
                topicsList
                if !progress.weakTopicStrengths.isEmpty {
                    suggestionsSection
                    studyWeakButton
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Topic Strengths")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $showWeakQuiz) {
            if let quiz = weakQuiz {
                QuizView(quiz: quiz)
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 8) {
            let strengths = progress.topicStrengths
            if strengths.isEmpty {
                Image(systemName: "chart.bar.xaxis")
                    .font(.system(size: 44))
                    .foregroundColor(.secondary)

                Text("No Data Yet")
                    .font(.title3)
                    .fontWeight(.semibold)

                Text("Take some quizzes to see your topic strengths and weaknesses.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            } else {
                let weakCount = progress.weakTopicStrengths.count
                let totalCount = strengths.count

                HStack(spacing: 16) {
                    VStack(spacing: 4) {
                        Text("\(totalCount)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Text("Categories")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    VStack(spacing: 4) {
                        Text("\(totalCount - weakCount)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        Text("Strong")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    VStack(spacing: 4) {
                        Text("\(weakCount)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(weakCount > 0 ? .red : .green)
                        Text("Weak")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
                )
            }
        }
    }

    // MARK: - Topics List

    private var topicsList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Performance by Category")
                .font(.headline)

            let strengths = progress.topicStrengths
            if strengths.isEmpty {
                // Show placeholder categories
                ForEach(placeholderCategories, id: \.self) { name in
                    topicRow(name: name, percentage: 0, total: 0)
                }
            } else {
                ForEach(strengths) { ts in
                    topicRow(name: ts.topic, percentage: ts.percentage, total: ts.totalCount)
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

    private func topicRow(name: String, percentage: Double, total: Int) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Circle()
                    .fill(colorForPercentage(percentage, hasData: total > 0))
                    .frame(width: 10, height: 10)

                Text(name)
                    .font(.subheadline)
                    .fontWeight(.medium)

                Spacer()

                if total > 0 {
                    Text(String(format: "%.0f%%", percentage))
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(colorForPercentage(percentage, hasData: true))
                } else {
                    Text("--")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color.gray.opacity(0.15))
                        .frame(height: 6)

                    if total > 0 {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(colorForPercentage(percentage, hasData: true))
                            .frame(width: geo.size.width * min(1.0, percentage / 100.0), height: 6)
                    }
                }
            }
            .frame(height: 6)

            if total > 0 {
                Text("\(Int(percentage / 100 * Double(total)))/\(total) correct")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    private func colorForPercentage(_ pct: Double, hasData: Bool) -> Color {
        guard hasData else { return .gray }
        if pct < 50 { return .red }
        if pct < 70 { return .orange }
        return .green
    }

    private var placeholderCategories: [String] {
        ["Recall", "Application", "Analysis", "Clinical"]
    }

    // MARK: - Suggestions

    private var suggestionsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Suggestions")
                .font(.headline)

            ForEach(progress.weakTopicStrengths) { ts in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "lightbulb.fill")
                        .font(.subheadline)
                        .foregroundColor(.yellow)

                    Text("Focus on **\(ts.topic)** questions — you're scoring \(String(format: "%.0f%%", ts.percentage))")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.yellow.opacity(0.08))
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - Study Weak Button

    private var studyWeakButton: some View {
        Button {
            weakQuiz = progress.generateWeakTopicsQuiz()
            if weakQuiz != nil {
                showWeakQuiz = true
            }
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "target")
                    .font(.title3)
                Text("Study Weak Topics")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.red.gradient)
            )
            .foregroundColor(.white)
        }
    }
}

#Preview {
    NavigationStack {
        WeakTopicsView()
    }
    .environmentObject(ProgressManager())
}
