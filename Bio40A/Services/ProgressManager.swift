import Foundation
import SwiftUI

class ProgressManager: ObservableObject {
    @Published var weekProgress: [WeekProgress] = []
    @Published var quizAttempts: [QuizAttempt] = []
    @Published var overallStats = OverallStats()
    @Published var flashcardDecks: [FlashcardDeck] = []

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

        // Update week progress
        if let idx = weekProgress.firstIndex(where: { $0.weekNumber == weekNumber }) {
            weekProgress[idx].quizScores[attempt.quizId] = attempt.percentage
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

    // MARK: - Study Time

    func addStudyTime(_ seconds: TimeInterval, weekNumber: Int) {
        overallStats.totalStudyTime += seconds
        if let idx = weekProgress.firstIndex(where: { $0.weekNumber == weekNumber }) {
            weekProgress[idx].studyTimeSeconds += seconds
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
        updateStreak()
        save()
    }

    func dueCards(in deckId: String) -> [Flashcard] {
        guard let deck = flashcardDecks.first(where: { $0.id == deckId }) else { return [] }
        return deck.cards.filter { $0.repetition.isDue }
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

    // MARK: - Persistence

    private func save() {
        let data = SaveData(
            weekProgress: weekProgress,
            quizAttempts: quizAttempts,
            overallStats: overallStats,
            flashcardDecks: flashcardDecks
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
    }

    func loadDefaultContent() {
        flashcardDecks = CourseContent.flashcardDecks
    }

    private struct SaveData: Codable {
        let weekProgress: [WeekProgress]
        let quizAttempts: [QuizAttempt]
        let overallStats: OverallStats
        let flashcardDecks: [FlashcardDeck]
    }
}
