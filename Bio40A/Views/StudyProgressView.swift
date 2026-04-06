import SwiftUI

struct StudyProgressView: View {
    @EnvironmentObject var progress: ProgressManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    streakSection
                    studyTimeSection
                    quizPerformanceSection
                    topicsSection
                    weeklyBreakdownSection
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Progress")
        }
    }

    // MARK: - Streak Section

    private var streakSection: some View {
        HStack(spacing: 16) {
            Image(systemName: "flame.fill")
                .font(.system(size: 44))
                .foregroundColor(progress.overallStats.currentStreak > 0 ? .orange : .gray.opacity(0.4))

            VStack(alignment: .leading, spacing: 4) {
                Text("\(progress.overallStats.currentStreak)")
                    .font(.system(size: 36, weight: .bold, design: .rounded))

                Text("Day Streak")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                if let lastDate = progress.overallStats.lastStudyDate {
                    Text("Last studied")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(lastDate, style: .relative)
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else {
                    Text("No sessions yet")
                        .font(.caption)
                        .foregroundColor(.secondary)
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

    // MARK: - Study Time Section

    private var studyTimeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Study Time", systemImage: "clock.fill")
                .font(.headline)
                .foregroundColor(.blue)

            HStack(spacing: 20) {
                VStack(spacing: 4) {
                    Text(totalStudyTimeFormatted)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("Total")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                VStack(spacing: 4) {
                    Text("\(progress.overallStats.totalQuizzesTaken)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                    Text("Quizzes")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()

                VStack(spacing: 4) {
                    Text("\(progress.overallStats.totalFlashcardsReviewed)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                    Text("Cards")
                        .font(.caption)
                        .foregroundColor(.secondary)
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

    // MARK: - Quiz Performance Chart

    private var quizPerformanceSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Quiz Performance", systemImage: "chart.bar.fill")
                .font(.headline)
                .foregroundColor(.blue)

            if progress.quizAttempts.isEmpty {
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "chart.bar")
                            .font(.title)
                            .foregroundColor(.gray.opacity(0.4))
                        Text("No quizzes taken yet")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 20)
                    Spacer()
                }
            } else {
                // Average score
                HStack {
                    Text("Average Score")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(String(format: "%.0f%%", progress.overallStats.averageQuizScore))
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(averageScoreColor)
                }

                // Bar chart of recent attempts (last 10)
                let recentAttempts = Array(progress.quizAttempts.suffix(10))
                barChart(attempts: recentAttempts)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    private func barChart(attempts: [QuizAttempt]) -> some View {
        VStack(spacing: 4) {
            // Bars
            HStack(alignment: .bottom, spacing: 6) {
                ForEach(Array(attempts.enumerated()), id: \.element.id) { _, attempt in
                    VStack(spacing: 4) {
                        Text(String(format: "%.0f", attempt.percentage))
                            .font(.system(size: 8, weight: .medium))
                            .foregroundColor(.secondary)

                        RoundedRectangle(cornerRadius: 4)
                            .fill(barColor(for: attempt.percentage))
                            .frame(height: max(4, CGFloat(attempt.percentage) * 0.8))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 90)

            // Baseline
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)

            // Labels
            Text("Recent Attempts")
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }

    private func barColor(for percentage: Double) -> Color {
        if percentage >= 90 { return .green }
        if percentage >= 70 { return .blue }
        if percentage >= 50 { return .orange }
        return .red
    }

    // MARK: - Topics Section

    private var topicsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Topic Mastery", systemImage: "brain.head.profile")
                .font(.headline)
                .foregroundColor(.blue)

            let strengths = progress.topicStrengths
            let strong = strengths.filter { !$0.isWeak }
            let weak = strengths.filter { $0.isWeak }

            if strengths.isEmpty {
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "brain")
                            .font(.title)
                            .foregroundColor(.gray.opacity(0.4))
                        Text("Complete quizzes to see topic analysis")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 20)
                    Spacer()
                }
            } else {
                // Strong topics
                if !strong.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.up.circle.fill")
                                .foregroundColor(.green)
                                .font(.caption)
                            Text("Strong Topics")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }

                        ForEach(strong) { topic in
                            topicStrengthRow(topic, color: .green)
                        }
                    }
                }

                // Weak topics
                if !weak.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.down.circle.fill")
                                .foregroundColor(.red)
                                .font(.caption)
                            Text("Needs Review")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                        }

                        ForEach(weak) { topic in
                            topicStrengthRow(topic, color: .red)
                        }
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

    private func topicStrengthRow(_ topic: ProgressManager.TopicStrength, color: Color) -> some View {
        VStack(spacing: 4) {
            HStack {
                Text(topic.topic)
                    .font(.caption)
                    .fontWeight(.medium)
                Spacer()
                Text("\(topic.correctCount)/\(topic.totalCount)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                Text(String(format: "%.0f%%", topic.percentage))
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(color.opacity(0.15))
                        .frame(height: 6)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(color)
                        .frame(width: geo.size.width * min(1.0, topic.percentage / 100.0), height: 6)
                }
            }
            .frame(height: 6)
        }
        .padding(.vertical, 2)
    }

    // MARK: - Weekly Breakdown

    private var weeklyBreakdownSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Weekly Breakdown", systemImage: "calendar")
                .font(.headline)
                .foregroundColor(.blue)

            if progress.weekProgress.isEmpty {
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "calendar.badge.clock")
                            .font(.title)
                            .foregroundColor(.gray.opacity(0.4))
                        Text("Start studying to see weekly progress")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 20)
                    Spacer()
                }
            } else {
                ForEach(progress.weekProgress.sorted(by: { $0.weekNumber < $1.weekNumber })) { week in
                    weekRow(week)
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

    private func weekRow(_ week: WeekProgress) -> some View {
        VStack(spacing: 8) {
            HStack {
                Text("Week \(week.weekNumber)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Text(week.studyTimeFormatted)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image(systemName: "book.fill")
                        .font(.caption2)
                        .foregroundColor(.blue)
                    Text("\(week.lessonsCompleted.count) lessons")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 4) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.caption2)
                        .foregroundColor(.green)
                    let avgScore = week.quizScores.values.isEmpty ? 0 : week.quizScores.values.reduce(0, +) / Double(week.quizScores.values.count)
                    Text(week.quizScores.isEmpty ? "No quizzes" : String(format: "%.0f%% avg", avgScore))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 4) {
                    Image(systemName: "rectangle.stack.fill")
                        .font(.caption2)
                        .foregroundColor(.orange)
                    Text("\(week.flashcardsReviewed) cards")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Spacer()
            }

            Divider()
        }
    }

    // MARK: - Helpers

    private var totalStudyTimeFormatted: String {
        let total = progress.overallStats.totalStudyTime
        let hours = Int(total) / 3600
        let minutes = (Int(total) % 3600) / 60
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        }
        return "\(minutes)m"
    }

    private var averageScoreColor: Color {
        let score = progress.overallStats.averageQuizScore
        if score >= 90 { return .green }
        if score >= 70 { return .blue }
        if score >= 50 { return .orange }
        return .red
    }
}

// MARK: - Flow Layout for Topic Tags

struct FlowLayout<Item: Hashable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content

    init(items: [Item], @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.content = content
    }

    var body: some View {
        var width: CGFloat = 0
        var rows: [[Item]] = [[]]

        // Simple wrapping: we estimate item widths
        // In production, use GeometryReader for precise layout
        let _ = items.forEach { item in
            // Approximate: each character ~7pt + padding
            let estimatedWidth: CGFloat = 100
            if width + estimatedWidth > 300 {
                rows.append([item])
                width = estimatedWidth
            } else {
                rows[rows.count - 1].append(item)
                width += estimatedWidth
            }
        }

        VStack(alignment: .leading, spacing: 6) {
            ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                HStack(spacing: 6) {
                    ForEach(row, id: \.self) { item in
                        content(item)
                    }
                }
            }
        }
    }
}

#Preview {
    StudyProgressView()
        .environmentObject(ProgressManager())
}
