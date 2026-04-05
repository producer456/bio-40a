import SwiftUI

struct HomeView: View {
    @EnvironmentObject var progress: ProgressManager
    @EnvironmentObject var notificationManager: NotificationManager
    @Binding var selectedTab: Int
    @State private var showWrongAnswers = false
    @State private var showSettings = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    welcomeSection
                    DueSoonSection()
                    weekProgressSection
                    quickActionsSection
                    wrongAnswersSection
                    overallStatsSection
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Bio 40A")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
                    .environmentObject(progress)
                    .environmentObject(notificationManager)
            }
            .navigationDestination(isPresented: $showWrongAnswers) {
                WrongAnswersView()
            }
        }
    }

    // MARK: - Welcome Section

    private var welcomeSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("Welcome Back!")
                    .font(.title2)
                    .fontWeight(.bold)

                if progress.overallStats.currentStreak > 0 {
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.orange)
                        Text("\(progress.overallStats.currentStreak)-day streak")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                } else {
                    Text("Start studying to build a streak!")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            Image(systemName: "stethoscope")
                .font(.system(size: 40))
                .foregroundColor(.blue)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - Week Progress

    private var weekProgressSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This Week")
                .font(.headline)
                .foregroundColor(.primary)

            let currentWeekProgress = progress.weekProgress.first(where: { $0.weekNumber == currentWeekNumber })

            HStack(spacing: 16) {
                StatCard(
                    icon: "book.closed.fill",
                    title: "Lessons",
                    value: "\(currentWeekProgress?.lessonsCompleted.count ?? 0)",
                    subtitle: "completed",
                    color: .blue
                )

                StatCard(
                    icon: "checkmark.circle.fill",
                    title: "Quizzes",
                    value: bestQuizScoreThisWeek,
                    subtitle: "best score",
                    color: .green
                )

                StatCard(
                    icon: "clock.fill",
                    title: "Study Time",
                    value: currentWeekProgress?.studyTimeFormatted ?? "0m",
                    subtitle: "this week",
                    color: .purple
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

    // MARK: - Quick Actions

    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Actions")
                .font(.headline)

            HStack(spacing: 12) {
                QuickActionButton(
                    icon: "book.fill",
                    label: "Start Lesson",
                    color: .blue
                ) { selectedTab = 2 }

                QuickActionButton(
                    icon: "checkmark.circle.fill",
                    label: "Take Quiz",
                    color: .green
                ) { selectedTab = 3 }

                QuickActionButton(
                    icon: "rectangle.on.rectangle.angled",
                    label: "Flashcards",
                    color: .orange
                ) { selectedTab = 5 }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - Wrong Answers

    private var wrongAnswersSection: some View {
        let wrongCount = progress.wrongAnswers.count

        return Group {
            if wrongCount > 0 {
                Button {
                    showWrongAnswers = true
                } label: {
                    HStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.red.gradient)
                                .frame(width: 50, height: 50)

                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Wrong Answers")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)

                            Text("\(wrongCount) question\(wrongCount == 1 ? "" : "s") to review")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemBackground))
                            .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
                    )
                }
            }
        }
    }

    // MARK: - Overall Stats

    private var overallStatsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Overall Stats")
                .font(.headline)

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                OverallStatRow(
                    icon: "clock.fill",
                    label: "Total Study Time",
                    value: totalStudyTimeFormatted,
                    color: .blue
                )

                OverallStatRow(
                    icon: "chart.bar.fill",
                    label: "Avg Quiz Score",
                    value: String(format: "%.0f%%", progress.overallStats.averageQuizScore),
                    color: .green
                )

                OverallStatRow(
                    icon: "rectangle.stack.fill",
                    label: "Cards Reviewed",
                    value: "\(progress.overallStats.totalFlashcardsReviewed)",
                    color: .orange
                )

                OverallStatRow(
                    icon: "pencil.and.list.clipboard",
                    label: "Quizzes Taken",
                    value: "\(progress.overallStats.totalQuizzesTaken)",
                    color: .purple
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

    // MARK: - Helpers

    private var currentWeekNumber: Int {
        // Default to week 1 for now
        1
    }

    private var bestQuizScoreThisWeek: String {
        let weekScores = progress.weekProgress
            .first(where: { $0.weekNumber == currentWeekNumber })?
            .quizScores.values
        guard let scores = weekScores, !scores.isEmpty else { return "--" }
        return String(format: "%.0f%%", scores.max() ?? 0)
    }

    private var totalStudyTimeFormatted: String {
        let total = progress.overallStats.totalStudyTime
        let hours = Int(total) / 3600
        let minutes = (Int(total) % 3600) / 60
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        }
        return "\(minutes)m"
    }
}

// MARK: - Supporting Views

struct StatCard: View {
    let icon: String
    let title: String
    let value: String
    let subtitle: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)

            Text(value)
                .font(.title3)
                .fontWeight(.bold)

            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
        )
    }
}

struct QuickActionButton: View {
    let icon: String
    let label: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(color.gradient)
                    )

                Text(label)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct OverallStatRow: View {
    let icon: String
    let label: String
    let value: String
    let color: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.body)
                .foregroundColor(color)
                .frame(width: 30)

            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(label)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color.opacity(0.08))
        )
    }
}

#Preview {
    HomeView(selectedTab: .constant(0))
        .environmentObject(ProgressManager())
        .environmentObject(NotificationManager())
}
