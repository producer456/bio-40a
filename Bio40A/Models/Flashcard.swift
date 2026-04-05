import Foundation

struct FlashcardDeck: Identifiable, Codable {
    let id: String
    let title: String
    let weekNumber: Int
    let category: String  // "Anatomical Terms", "Chemistry", etc.
    var cards: [Flashcard]

    var cardCount: Int { cards.count }
}

struct Flashcard: Identifiable, Codable {
    let id: String
    let front: String     // question/term
    let back: String      // answer/definition
    let hint: String?     // optional hint
    var repetition: SpacedRepetitionData

    struct SpacedRepetitionData: Codable {
        var easeFactor: Double = 2.5
        var interval: Int = 0       // days until next review
        var repetitions: Int = 0
        var nextReview: Date = Date()
        var lastRating: Int = 0     // 0-5 scale

        var isDue: Bool {
            nextReview <= Date()
        }
    }
}

enum CardRating: Int, CaseIterable {
    case again = 0      // complete blackout
    case hard = 1       // significant difficulty
    case good = 3       // correct with effort
    case easy = 5       // effortless recall

    var label: String {
        switch self {
        case .again: return "Again"
        case .hard: return "Hard"
        case .good: return "Good"
        case .easy: return "Easy"
        }
    }

    var color: String {
        switch self {
        case .again: return "red"
        case .hard: return "orange"
        case .good: return "blue"
        case .easy: return "green"
        }
    }
}
