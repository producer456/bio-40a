import Foundation

struct FillInBlankQuestion: Identifiable, Codable {
    let id: String
    let statement: String       // "The _____ plane..."
    let answer: String          // "sagittal"
    let acceptableAnswers: [String]  // ["sagittal", "sagittal plane"]
    let weekNumber: Int

    /// Check if a user's answer is correct using case-insensitive fuzzy matching
    func isCorrect(_ userAnswer: String) -> Bool {
        let trimmed = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if trimmed.isEmpty { return false }

        for acceptable in acceptableAnswers {
            let target = acceptable.lowercased()
            if trimmed == target { return true }
            // Fuzzy: allow missing trailing 's' or extra trailing 's'
            if trimmed + "s" == target || trimmed == target + "s" { return true }
            // Allow edit distance of 1 for short words, 2 for longer
            let threshold = target.count <= 5 ? 1 : 2
            if levenshteinDistance(trimmed, target) <= threshold { return true }
        }
        return false
    }

    private func levenshteinDistance(_ s1: String, _ s2: String) -> Int {
        let a = Array(s1)
        let b = Array(s2)
        let m = a.count
        let n = b.count
        if m == 0 { return n }
        if n == 0 { return m }

        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0...m { matrix[i][0] = i }
        for j in 0...n { matrix[0][j] = j }

        for i in 1...m {
            for j in 1...n {
                let cost = a[i - 1] == b[j - 1] ? 0 : 1
                matrix[i][j] = min(
                    matrix[i - 1][j] + 1,
                    matrix[i][j - 1] + 1,
                    matrix[i - 1][j - 1] + cost
                )
            }
        }
        return matrix[m][n]
    }
}

struct TrueFalseStatement: Identifiable, Codable {
    let id: String
    let statement: String
    let isTrue: Bool
    let explanation: String
    let weekNumber: Int
}

struct CategorySortSet: Identifiable, Codable {
    let id: String
    let title: String
    let categories: [String]
    let items: [SortItem]
    let weekNumber: Int
}

struct SortItem: Identifiable, Codable {
    let id: String
    let name: String
    let correctCategory: String
}
