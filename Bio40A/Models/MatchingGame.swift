import Foundation

struct MatchingSet: Identifiable {
    let id: String
    let title: String
    let category: String
    let weekNumber: Int
    let pairs: [MatchPair]

    var pairCount: Int { pairs.count }
}

struct MatchPair: Identifiable {
    let id: String
    let term: String
    let definition: String
}

struct MatchingGameResult: Codable {
    let setId: String
    let bestTime: TimeInterval
    let accuracy: Double  // 0.0 - 1.0
    let date: Date
}
