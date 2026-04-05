import SwiftUI

struct LessonListView: View {
    @EnvironmentObject var progress: ProgressManager

    // Sample lessons — replace with CourseContent.allLessons when available
    @State private var lessons: [Lesson] = []

    private var lessonsByWeek: [Int: [Lesson]] {
        Dictionary(grouping: lessons, by: \.weekNumber)
    }

    private var sortedWeeks: [Int] {
        lessonsByWeek.keys.sorted()
    }

    var body: some View {
        NavigationStack {
            Group {
                if lessons.isEmpty {
                    emptyState
                } else {
                    lessonList
                }
            }
            .navigationTitle("Lessons")
            .background(Color(.systemGroupedBackground))
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "book.closed")
                .font(.system(size: 50))
                .foregroundColor(.blue.opacity(0.5))
            Text("No Lessons Available")
                .font(.title3)
                .fontWeight(.medium)
            Text("Lessons will appear here once course content is loaded.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(40)
    }

    private var lessonList: some View {
        List {
            ForEach(sortedWeeks, id: \.self) { week in
                Section {
                    ForEach(lessonsByWeek[week] ?? []) { lesson in
                        NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                            LessonRow(lesson: lesson, isComplete: progress.isLessonComplete(lesson.id))
                        }
                    }
                } header: {
                    WeekHeader(weekNumber: week)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

// MARK: - Week Header

struct WeekHeader: View {
    let weekNumber: Int

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "calendar")
                .foregroundColor(.blue)
            Text("Week \(weekNumber)")
                .font(.headline)
                .foregroundColor(.primary)
        }
        .textCase(nil)
        .padding(.vertical, 4)
    }
}

// MARK: - Lesson Row

struct LessonRow: View {
    let lesson: Lesson
    let isComplete: Bool

    var body: some View {
        HStack(spacing: 14) {
            // Completion indicator
            ZStack {
                Circle()
                    .fill(isComplete ? Color.green : Color.blue.opacity(0.15))
                    .frame(width: 40, height: 40)

                Image(systemName: isComplete ? "checkmark" : "book.fill")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isComplete ? .white : .blue)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)

                HStack(spacing: 8) {
                    Text(lesson.dateString)
                        .font(.caption)
                        .foregroundColor(.secondary)

                    if !lesson.textbookChapter.isEmpty {
                        Text(lesson.textbookChapter)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(
                                Capsule()
                                    .fill(Color.blue.opacity(0.1))
                            )
                    }
                }
            }

            Spacer()

            if isComplete {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    LessonListView()
        .environmentObject(ProgressManager())
}
