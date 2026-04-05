import SwiftUI

struct BookmarksView: View {
    @EnvironmentObject var progress: ProgressManager

    private var lessons: [Lesson] { CourseContent.lessons }

    private var bookmarkedItems: [BookmarkItem] {
        var items: [BookmarkItem] = []
        for sectionId in progress.bookmarkedSections {
            for lesson in lessons {
                if let section = lesson.sections.first(where: { $0.id == sectionId }) {
                    items.append(BookmarkItem(
                        sectionId: sectionId,
                        sectionHeading: section.heading,
                        contentPreview: String(section.content.prefix(100)),
                        lessonTitle: lesson.title,
                        lesson: lesson
                    ))
                }
            }
        }
        return items
    }

    var body: some View {
        NavigationStack {
            Group {
                if bookmarkedItems.isEmpty {
                    emptyState
                } else {
                    bookmarkList
                }
            }
            .navigationTitle("Bookmarks")
            .background(Color(.systemGroupedBackground))
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "star")
                .font(.system(size: 50))
                .foregroundColor(.blue.opacity(0.4))
            Text("No Bookmarks Yet")
                .font(.title3)
                .fontWeight(.medium)
            Text("Tap the star icon next to any section heading in a lesson to bookmark it for quick reference.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .padding(40)
    }

    private var bookmarkList: some View {
        List {
            ForEach(bookmarkedItems) { item in
                NavigationLink(destination: LessonDetailView(lesson: item.lesson)) {
                    BookmarkRow(item: item)
                }
            }
            .onDelete(perform: deleteBookmarks)
        }
        .listStyle(.insetGrouped)
    }

    private func deleteBookmarks(at offsets: IndexSet) {
        for index in offsets {
            let sectionId = bookmarkedItems[index].sectionId
            progress.toggleBookmark(sectionId)
        }
    }
}

// MARK: - Bookmark Item

struct BookmarkItem: Identifiable {
    var id: String { sectionId }
    let sectionId: String
    let sectionHeading: String
    let contentPreview: String
    let lessonTitle: String
    let lesson: Lesson
}

// MARK: - Bookmark Row

struct BookmarkRow: View {
    let item: BookmarkItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "star.fill")
                .font(.title3)
                .foregroundColor(.yellow)
                .padding(.top, 2)

            VStack(alignment: .leading, spacing: 6) {
                Text(item.sectionHeading)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(item.lessonTitle)
                    .font(.caption)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(
                        Capsule().fill(Color.blue.opacity(0.1))
                    )

                Text(item.contentPreview + (item.contentPreview.count >= 100 ? "..." : ""))
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    BookmarksView()
        .environmentObject(ProgressManager())
}
