import SwiftUI

struct LessonListView: View {
    @EnvironmentObject var progress: ProgressManager
    @State private var searchText = ""
    @State private var lockedAlertWeek: Int?
    @State private var showLockedAlert = false

    private var lessons: [Lesson] { CourseContent.lessons }

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
                } else if !searchText.isEmpty {
                    searchResultsList
                } else {
                    lessonList
                }
            }
            .navigationTitle("Lessons")
            .background(Color(.systemGroupedBackground))
            .searchable(text: $searchText, prompt: "Search lessons, terms, flashcards...")
            .alert("Content Locked", isPresented: $showLockedAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                if let week = lockedAlertWeek {
                    Text("This lesson unlocks in Week \(week) (\(ContentUnlockManager.unlockDateString(for: week)))")
                }
            }
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
                        let unlocked = ContentUnlockManager.isUnlocked(lesson.weekNumber)
                        if unlocked {
                            NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                                LessonRow(lesson: lesson, isComplete: progress.isLessonComplete(lesson.id), isLocked: false)
                            }
                        } else {
                            Button {
                                lockedAlertWeek = lesson.weekNumber
                                showLockedAlert = true
                            } label: {
                                LessonRow(lesson: lesson, isComplete: false, isLocked: true)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                } header: {
                    WeekHeader(weekNumber: week)
                }
            }
        }
        .listStyle(.insetGrouped)
    }

    // MARK: - Search

    private var searchResults: [SearchResult] {
        let query = searchText.lowercased().trimmingCharacters(in: .whitespaces)
        guard !query.isEmpty else { return [] }

        var results: [SearchResult] = []

        // Search lessons
        for lesson in lessons {
            for section in lesson.sections {
                // Search section heading
                if section.heading.lowercased().contains(query) {
                    results.append(SearchResult(
                        id: "heading-\(section.id)",
                        lessonId: lesson.id,
                        lessonTitle: lesson.title,
                        matchType: .sectionHeading,
                        matchText: section.heading,
                        lesson: lesson
                    ))
                }

                // Search section content
                if section.content.lowercased().contains(query) {
                    let snippet = extractSnippet(from: section.content, query: query)
                    results.append(SearchResult(
                        id: "content-\(section.id)",
                        lessonId: lesson.id,
                        lessonTitle: lesson.title,
                        matchType: .content,
                        matchText: snippet,
                        lesson: lesson
                    ))
                }

                // Search key terms
                for term in section.keyTerms {
                    if term.term.lowercased().contains(query) || term.definition.lowercased().contains(query) {
                        results.append(SearchResult(
                            id: "term-\(term.id)",
                            lessonId: lesson.id,
                            lessonTitle: lesson.title,
                            matchType: .keyTerm,
                            matchText: "\(term.term): \(term.definition)",
                            lesson: lesson
                        ))
                    }
                }
            }
        }

        // Search flashcard decks
        for deck in progress.flashcardDecks {
            for card in deck.cards {
                if card.front.lowercased().contains(query) || card.back.lowercased().contains(query) {
                    let matchText = card.front.lowercased().contains(query) ? card.front : card.back
                    // Find the lesson for this deck's week
                    let lesson = lessons.first(where: { $0.weekNumber == deck.weekNumber })
                    results.append(SearchResult(
                        id: "flash-\(card.id)",
                        lessonId: lesson?.id ?? deck.id,
                        lessonTitle: deck.title,
                        matchType: .flashcard,
                        matchText: "\(card.front) — \(card.back)",
                        lesson: lesson
                    ))
                }
            }
        }

        return results
    }

    private var searchResultsGrouped: [(String, [SearchResult])] {
        let grouped = Dictionary(grouping: searchResults, by: \.lessonTitle)
        return grouped.sorted { $0.key < $1.key }
    }

    private var searchResultsList: some View {
        List {
            if searchResults.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 36))
                        .foregroundColor(.secondary.opacity(0.5))
                    Text("No results for \"\(searchText)\"")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .listRowBackground(Color.clear)
            } else {
                ForEach(searchResultsGrouped, id: \.0) { lessonTitle, results in
                    Section {
                        ForEach(results) { result in
                            if let lesson = result.lesson {
                                NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                                    SearchResultRow(result: result, searchText: searchText)
                                }
                            } else {
                                SearchResultRow(result: result, searchText: searchText)
                            }
                        }
                    } header: {
                        Text(lessonTitle)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .textCase(nil)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }

    private func extractSnippet(from text: String, query: String, windowSize: Int = 80) -> String {
        let lower = text.lowercased()
        guard let range = lower.range(of: query) else { return String(text.prefix(120)) }
        let matchStart = text.distance(from: text.startIndex, to: range.lowerBound)
        let snippetStart = max(0, matchStart - windowSize / 2)
        let snippetEnd = min(text.count, matchStart + query.count + windowSize / 2)
        let startIdx = text.index(text.startIndex, offsetBy: snippetStart)
        let endIdx = text.index(text.startIndex, offsetBy: snippetEnd)
        var snippet = String(text[startIdx..<endIdx])
        if snippetStart > 0 { snippet = "..." + snippet }
        if snippetEnd < text.count { snippet = snippet + "..." }
        return snippet
    }
}

// MARK: - Search Models

struct SearchResult: Identifiable {
    let id: String
    let lessonId: String
    let lessonTitle: String
    let matchType: MatchType
    let matchText: String
    let lesson: Lesson?

    enum MatchType {
        case sectionHeading
        case content
        case keyTerm
        case flashcard

        var icon: String {
            switch self {
            case .sectionHeading: return "text.book.closed"
            case .content: return "doc.text"
            case .keyTerm: return "textformat.abc"
            case .flashcard: return "rectangle.on.rectangle.angled"
            }
        }

        var label: String {
            switch self {
            case .sectionHeading: return "Section"
            case .content: return "Content"
            case .keyTerm: return "Key Term"
            case .flashcard: return "Flashcard"
            }
        }
    }
}

// MARK: - Search Result Row

struct SearchResultRow: View {
    let result: SearchResult
    let searchText: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: result.matchType.icon)
                .font(.subheadline)
                .foregroundColor(.blue)
                .frame(width: 24, height: 24)
                .padding(.top, 2)

            VStack(alignment: .leading, spacing: 4) {
                Text(result.matchType.label)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(
                        Capsule().fill(Color.blue.opacity(0.1))
                    )

                highlightedText(result.matchText, highlight: searchText)
                    .font(.subheadline)
                    .lineLimit(3)
            }
        }
        .padding(.vertical, 4)
    }

    private func highlightedText(_ text: String, highlight: String) -> Text {
        let query = highlight.lowercased()
        let lower = text.lowercased()

        guard !query.isEmpty, let range = lower.range(of: query) else {
            return Text(text)
        }

        let before = String(text[text.startIndex..<range.lowerBound])
        let match = String(text[range.lowerBound..<range.upperBound])
        let after = String(text[range.upperBound...])

        return Text(before)
            + Text(match).bold().foregroundColor(.blue)
            + Text(after)
    }
}

// MARK: - Week Header

struct WeekHeader: View {
    let weekNumber: Int

    private var isUnlocked: Bool {
        ContentUnlockManager.isUnlocked(weekNumber)
    }

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: isUnlocked ? "calendar" : "lock.fill")
                .foregroundColor(isUnlocked ? .blue : .secondary)
            Text("Week \(weekNumber)")
                .font(.headline)
                .foregroundColor(isUnlocked ? .primary : .secondary)
            if !isUnlocked {
                Spacer()
                Text(ContentUnlockManager.unlockDateString(for: weekNumber))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .textCase(nil)
        .padding(.vertical, 4)
    }
}

// MARK: - Lesson Row

struct LessonRow: View {
    let lesson: Lesson
    let isComplete: Bool
    var isLocked: Bool = false

    var body: some View {
        HStack(spacing: 14) {
            // Completion indicator
            ZStack {
                Circle()
                    .fill(isLocked ? Color.gray.opacity(0.15) : (isComplete ? Color.green : Color.blue.opacity(0.15)))
                    .frame(width: 40, height: 40)

                Image(systemName: isLocked ? "lock.fill" : (isComplete ? "checkmark" : "book.fill"))
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isLocked ? .gray : (isComplete ? .white : .blue))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(lesson.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .foregroundColor(isLocked ? .secondary : .primary)

                HStack(spacing: 8) {
                    Text(lesson.dateString)
                        .font(.caption)
                        .foregroundColor(.secondary)

                    if !lesson.textbookChapter.isEmpty {
                        Text(lesson.textbookChapter)
                            .font(.caption)
                            .foregroundColor(isLocked ? .secondary : .blue)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(
                                Capsule()
                                    .fill(isLocked ? Color.gray.opacity(0.1) : Color.blue.opacity(0.1))
                            )
                    }
                }
            }

            Spacer()

            if isLocked {
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                    .font(.caption)
            } else if isComplete {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 4)
        .opacity(isLocked ? 0.6 : 1.0)
    }
}

#Preview {
    LessonListView()
        .environmentObject(ProgressManager())
}
