import Foundation
import SwiftUI

class ProgressManager: ObservableObject {
    @Published var weekProgress: [WeekProgress] = []
    @Published var quizAttempts: [QuizAttempt] = []
    @Published var overallStats = OverallStats()
    @Published var flashcardDecks: [FlashcardDeck] = []
    @Published var bookmarkedSections: [String] = []
    @Published var notes: [String: String] = [:]
    @Published var completedAssignments: [String] = []

    private let saveKey = "bio40a_progress"

    init() {
        load()
    }

    // MARK: - Lesson Progress

    func markLessonComplete(_ lessonId: String, weekNumber: Int) {
        if let idx = weekProgress.firstIndex(where: { $0.weekNumber == weekNumber }) {
            if !weekProgress[idx].lessonsCompleted.contains(lessonId) {
                weekProgress[idx].lessonsCompleted.append(lessonId)
            }
        } else {
            let wp = WeekProgress(
                id: UUID().uuidString,
                weekNumber: weekNumber,
                lessonsCompleted: [lessonId],
                quizScores: [:],
                flashcardsReviewed: 0,
                studyTimeSeconds: 0
            )
            weekProgress.append(wp)
        }
        updateStreak()
        save()
    }

    func isLessonComplete(_ lessonId: String) -> Bool {
        weekProgress.flatMap(\.lessonsCompleted).contains(lessonId)
    }

    // MARK: - Quiz Progress

    func recordQuizAttempt(_ attempt: QuizAttempt, weekNumber: Int) {
        quizAttempts.append(attempt)
        overallStats.totalQuizzesTaken += 1

        // Update average
        let totalScore = quizAttempts.reduce(0.0) { $0 + $1.percentage }
        overallStats.averageQuizScore = totalScore / Double(quizAttempts.count)

        // Update week progress — keep best score
        if let idx = weekProgress.firstIndex(where: { $0.weekNumber == weekNumber }) {
            let existing = weekProgress[idx].quizScores[attempt.quizId] ?? 0
            weekProgress[idx].quizScores[attempt.quizId] = max(existing, attempt.percentage)
        } else {
            let wp = WeekProgress(
                id: UUID().uuidString,
                weekNumber: weekNumber,
                lessonsCompleted: [],
                quizScores: [attempt.quizId: attempt.percentage],
                flashcardsReviewed: 0,
                studyTimeSeconds: 0
            )
            weekProgress.append(wp)
        }

        updateStreak()
        save()
    }

    func bestScore(for quizId: String) -> Double? {
        quizAttempts
            .filter { $0.quizId == quizId }
            .map(\.percentage)
            .max()
    }

    // MARK: - Wrong Answers

    struct WrongAnswer: Identifiable {
        let id: String  // unique per occurrence
        let question: QuizQuestion
        let userAnswerIndex: Int
        let userAnswerText: String
        let correctAnswerText: String
        let quizTitle: String
        let quizId: String
        let attemptDate: Date
    }

    /// Returns all wrong answers across all quiz attempts, using the most recent attempt per quiz.
    var wrongAnswers: [WrongAnswer] {
        let allQuizzes = CourseContent.quizzes + CourseContent.practiceExams
        var results: [WrongAnswer] = []

        // Group attempts by quizId and take the most recent for each
        let grouped = Dictionary(grouping: quizAttempts, by: \.quizId)

        for (quizId, attempts) in grouped {
            guard let latestAttempt = attempts.sorted(by: { $0.date < $1.date }).last,
                  let quiz = allQuizzes.first(where: { $0.id == quizId })
            else { continue }

            for (index, question) in quiz.questions.enumerated() {
                guard index < latestAttempt.answers.count else { continue }
                let userIndex = latestAttempt.answers[index]
                if userIndex != question.correctIndex {
                    let wa = WrongAnswer(
                        id: "\(latestAttempt.id)-\(index)",
                        question: question,
                        userAnswerIndex: userIndex,
                        userAnswerText: userIndex >= 0 && userIndex < question.choices.count ? question.choices[userIndex] : "Not answered",
                        correctAnswerText: question.choices[question.correctIndex],
                        quizTitle: quiz.title,
                        quizId: quiz.id,
                        attemptDate: latestAttempt.date
                    )
                    results.append(wa)
                }
            }
        }

        return results.sorted { $0.attemptDate > $1.attemptDate }
    }

    /// Groups wrong answers by question category.
    var wrongAnswersByCategory: [QuizQuestion.QuestionCategory: [WrongAnswer]] {
        Dictionary(grouping: wrongAnswers, by: { $0.question.category })
    }

    /// Generates a Quiz from the user's wrong answers for retry practice.
    func generateWrongAnswersQuiz() -> Quiz? {
        let wrongs = wrongAnswers
        guard !wrongs.isEmpty else { return nil }

        // Deduplicate by question ID (same question could appear from different quizzes theoretically)
        var seen = Set<String>()
        var uniqueQuestions: [QuizQuestion] = []
        for wa in wrongs {
            if !seen.contains(wa.question.id) {
                seen.insert(wa.question.id)
                uniqueQuestions.append(wa.question)
            }
        }

        return Quiz(
            id: "wrong-answers-retry",
            title: "Retry Wrong Questions",
            weekNumber: 0,
            lessonIds: [],
            questions: uniqueQuestions,
            timeLimit: nil
        )
    }

    // MARK: - Study Time

    func addStudyTime(_ seconds: TimeInterval, weekNumber: Int) {
        overallStats.totalStudyTime += seconds
        if let idx = weekProgress.firstIndex(where: { $0.weekNumber == weekNumber }) {
            weekProgress[idx].studyTimeSeconds += seconds
        } else {
            let wp = WeekProgress(
                id: UUID().uuidString,
                weekNumber: weekNumber,
                lessonsCompleted: [],
                quizScores: [:],
                flashcardsReviewed: 0,
                studyTimeSeconds: seconds
            )
            weekProgress.append(wp)
        }
        save()
    }

    // MARK: - Flashcards

    func updateFlashcard(deckId: String, cardId: String, rating: CardRating) {
        guard let deckIdx = flashcardDecks.firstIndex(where: { $0.id == deckId }),
              let cardIdx = flashcardDecks[deckIdx].cards.firstIndex(where: { $0.id == cardId })
        else { return }

        var card = flashcardDecks[deckIdx].cards[cardIdx]
        var rep = card.repetition

        rep.lastRating = rating.rawValue

        if rating == .again {
            rep.repetitions = 0
            rep.interval = 0
            rep.nextReview = Date()
        } else {
            if rep.repetitions == 0 {
                rep.interval = 1
            } else if rep.repetitions == 1 {
                rep.interval = 6
            } else {
                rep.interval = Int(Double(rep.interval) * rep.easeFactor)
            }

            rep.easeFactor = max(1.3, rep.easeFactor + 0.1 - Double(5 - rating.rawValue) * (0.08 + Double(5 - rating.rawValue) * 0.02))
            rep.repetitions += 1
            rep.nextReview = Calendar.current.date(byAdding: .day, value: rep.interval, to: Date()) ?? Date()
        }

        card.repetition = rep
        flashcardDecks[deckIdx].cards[cardIdx] = card

        overallStats.totalFlashcardsReviewed += 1

        // Track per-week flashcard reviews
        let weekNum = flashcardDecks[deckIdx].weekNumber
        if let wpIdx = weekProgress.firstIndex(where: { $0.weekNumber == weekNum }) {
            weekProgress[wpIdx].flashcardsReviewed += 1
        } else {
            let wp = WeekProgress(
                id: UUID().uuidString,
                weekNumber: weekNum,
                lessonsCompleted: [],
                quizScores: [:],
                flashcardsReviewed: 1,
                studyTimeSeconds: 0
            )
            weekProgress.append(wp)
        }

        updateStreak()
        save()
    }

    func dueCards(in deckId: String) -> [Flashcard] {
        guard let deck = flashcardDecks.first(where: { $0.id == deckId }) else { return [] }
        return deck.cards.filter { $0.repetition.isDue }
    }

    // MARK: - Bookmarks

    func toggleBookmark(_ sectionId: String) {
        if let idx = bookmarkedSections.firstIndex(of: sectionId) {
            bookmarkedSections.remove(at: idx)
        } else {
            bookmarkedSections.append(sectionId)
        }
        save()
    }

    func isBookmarked(_ sectionId: String) -> Bool {
        bookmarkedSections.contains(sectionId)
    }

    // MARK: - Notes

    func saveNote(for lessonId: String, text: String) {
        if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            notes.removeValue(forKey: lessonId)
        } else {
            notes[lessonId] = text
        }
        save()
    }

    func note(for lessonId: String) -> String {
        notes[lessonId] ?? ""
    }

    // MARK: - Assignments

    func toggleAssignment(_ id: String) {
        if let idx = completedAssignments.firstIndex(of: id) {
            completedAssignments.remove(at: idx)
        } else {
            completedAssignments.append(id)
        }
        save()
    }

    func isAssignmentComplete(_ id: String) -> Bool {
        completedAssignments.contains(id)
    }

    // MARK: - Streak

    private func updateStreak() {
        let today = Calendar.current.startOfDay(for: Date())
        if let last = overallStats.lastStudyDate {
            let lastDay = Calendar.current.startOfDay(for: last)
            let diff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
            if diff == 1 {
                overallStats.currentStreak += 1
            } else if diff > 1 {
                overallStats.currentStreak = 1
            }
        } else {
            overallStats.currentStreak = 1
        }
        overallStats.lastStudyDate = Date()
    }

    // MARK: - All Due Cards (across all decks)

    func allDueCards() -> [(deckId: String, card: Flashcard)] {
        var result: [(deckId: String, card: Flashcard)] = []
        for deck in flashcardDecks {
            for card in deck.cards where card.repetition.isDue {
                result.append((deckId: deck.id, card: card))
            }
        }
        return result.shuffled()
    }

    // MARK: - Topic Strength / Weak Topic Detection

    struct TopicStrength: Identifiable {
        let id: String
        let topic: String
        let category: QuizQuestion.QuestionCategory
        let correctCount: Int
        let totalCount: Int
        var percentage: Double {
            guard totalCount > 0 else { return 0 }
            return Double(correctCount) / Double(totalCount) * 100
        }
        var isWeak: Bool { percentage < 70 }
    }

    var topicStrengths: [TopicStrength] {
        let allQuizzes = CourseContent.quizzes + CourseContent.practiceExams

        // For each quiz attempt, walk through answers and tally per-category
        var correctByCategory: [QuizQuestion.QuestionCategory: Int] = [:]
        var totalByCategory: [QuizQuestion.QuestionCategory: Int] = [:]

        for attempt in quizAttempts {
            guard let quiz = allQuizzes.first(where: { $0.id == attempt.quizId }) else { continue }
            for (index, question) in quiz.questions.enumerated() {
                guard index < attempt.answers.count else { continue }
                let cat = question.category
                totalByCategory[cat, default: 0] += 1
                if attempt.answers[index] == question.correctIndex {
                    correctByCategory[cat, default: 0] += 1
                }
            }
        }

        let categoryNames: [QuizQuestion.QuestionCategory: String] = [
            .recall: "Recall",
            .application: "Application",
            .analysis: "Analysis",
            .clinical: "Clinical"
        ]

        return totalByCategory.map { cat, total in
            TopicStrength(
                id: cat.rawValue,
                topic: categoryNames[cat] ?? cat.rawValue.capitalized,
                category: cat,
                correctCount: correctByCategory[cat] ?? 0,
                totalCount: total
            )
        }.sorted { $0.percentage < $1.percentage }
    }

    var weakTopicStrengths: [TopicStrength] {
        topicStrengths.filter { $0.isWeak }
    }

    /// Generates a quiz composed only of questions from weak categories.
    func generateWeakTopicsQuiz() -> Quiz? {
        let weakCategories = Set(weakTopicStrengths.map(\.category))
        guard !weakCategories.isEmpty else { return nil }

        let allQuizzes = CourseContent.quizzes + CourseContent.practiceExams
        let questions = allQuizzes.flatMap(\.questions).filter { weakCategories.contains($0.category) }
        guard !questions.isEmpty else { return nil }

        // Deduplicate by question id
        var seen = Set<String>()
        var unique: [QuizQuestion] = []
        for q in questions {
            if !seen.contains(q.id) {
                seen.insert(q.id)
                unique.append(q)
            }
        }

        return Quiz(
            id: "weak-topics-quiz",
            title: "Weak Topics Review",
            weekNumber: 0,
            lessonIds: [],
            questions: unique.shuffled(),
            timeLimit: nil
        )
    }

    // MARK: - Reset

    func resetAllProgress() {
        weekProgress = []
        quizAttempts = []
        overallStats = OverallStats()
        flashcardDecks = []
        bookmarkedSections = []
        notes = [:]
        completedAssignments = []
        loadDefaultContent()
        save()
    }

    // MARK: - Persistence

    private func save() {
        let data = SaveData(
            weekProgress: weekProgress,
            quizAttempts: quizAttempts,
            overallStats: overallStats,
            flashcardDecks: flashcardDecks,
            bookmarkedSections: bookmarkedSections,
            notes: notes,
            completedAssignments: completedAssignments
        )
        if let encoded = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: saveKey),
              let decoded = try? JSONDecoder().decode(SaveData.self, from: data)
        else {
            // First launch — load default content
            loadDefaultContent()
            return
        }
        weekProgress = decoded.weekProgress
        quizAttempts = decoded.quizAttempts
        overallStats = decoded.overallStats
        flashcardDecks = decoded.flashcardDecks
        bookmarkedSections = decoded.bookmarkedSections
        notes = decoded.notes
        completedAssignments = decoded.completedAssignments
    }

    func loadDefaultContent() {
        flashcardDecks = CourseContent.flashcardDecks
    }

    private struct SaveData: Codable {
        let weekProgress: [WeekProgress]
        let quizAttempts: [QuizAttempt]
        let overallStats: OverallStats
        let flashcardDecks: [FlashcardDeck]
        var bookmarkedSections: [String] = []
        var notes: [String: String] = [:]
        var completedAssignments: [String] = []
    }
}
