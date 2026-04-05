import Foundation

struct Quiz: Identifiable, Codable {
    let id: String
    let title: String
    let weekNumber: Int
    let lessonIds: [String]  // which lessons this quiz covers
    let questions: [QuizQuestion]
    let timeLimit: Int?  // seconds, nil = untimed

    var questionCount: Int { questions.count }
}

struct QuizQuestion: Identifiable, Codable {
    let id: String
    let question: String
    let choices: [String]
    let correctIndex: Int
    let explanation: String
    let difficulty: Difficulty
    let category: QuestionCategory

    enum Difficulty: String, Codable {
        case easy, medium, hard
    }

    enum QuestionCategory: String, Codable {
        case recall       // simple fact recall
        case application  // apply concept to scenario
        case analysis     // compare/evaluate
        case clinical     // EMT/clinical scenario
    }
}

struct QuizAttempt: Identifiable, Codable {
    let id: String
    let quizId: String
    let date: Date
    let answers: [Int]  // index of chosen answer for each question
    let score: Int       // number correct
    let totalQuestions: Int
    let timeSpent: TimeInterval

    var percentage: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(score) / Double(totalQuestions) * 100
    }
}
