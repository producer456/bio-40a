import Foundation

struct WeekProgress: Identifiable, Codable {
    let id: String
    let weekNumber: Int
    var lessonsCompleted: [String]  // lesson IDs
    var quizScores: [String: Double]  // quizId -> percentage
    var flashcardsReviewed: Int
    var studyTimeSeconds: TimeInterval

    var studyTimeFormatted: String {
        let hours = Int(studyTimeSeconds) / 3600
        let minutes = (Int(studyTimeSeconds) % 3600) / 60
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        }
        return "\(minutes)m"
    }
}

struct OverallStats: Codable {
    var totalStudyTime: TimeInterval = 0
    var totalQuizzesTaken: Int = 0
    var averageQuizScore: Double = 0
    var totalFlashcardsReviewed: Int = 0
    var currentStreak: Int = 0  // consecutive days studied
    var lastStudyDate: Date?
    var strongTopics: [String] = []
    var weakTopics: [String] = []
}
