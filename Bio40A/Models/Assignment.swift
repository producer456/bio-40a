import Foundation

struct Assignment: Identifiable, Codable {
    let id: String
    let code: String        // "P1", "H1", "Q1", "MT1"
    let title: String       // "Pre-lecture Work 1"
    let type: AssignmentType
    let dueDate: Date
    let weekNumber: Int
    let points: Int
    var isComplete: Bool = false

    enum AssignmentType: String, Codable, CaseIterable {
        case preLecture = "Pre-lecture"
        case homework = "Homework"
        case quiz = "Quiz"
        case midterm = "Midterm"
        case lectureActivity = "Lecture Activity"

        var icon: String {
            switch self {
            case .preLecture: return "doc.text.fill"
            case .homework: return "pencil.and.list.clipboard"
            case .quiz: return "checkmark.circle.fill"
            case .midterm: return "doc.on.clipboard.fill"
            case .lectureActivity: return "person.3.fill"
            }
        }

        var color: String {
            switch self {
            case .preLecture: return "blue"
            case .homework: return "purple"
            case .quiz: return "green"
            case .midterm: return "red"
            case .lectureActivity: return "orange"
            }
        }
    }

    /// Days from now until due. Negative means past due.
    var daysUntilDue: Int {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let due = calendar.startOfDay(for: dueDate)
        return calendar.dateComponents([.day], from: today, to: due).day ?? 0
    }

    var isDueToday: Bool { daysUntilDue == 0 }
    var isDueTomorrow: Bool { daysUntilDue == 1 }
    var isPastDue: Bool { daysUntilDue < 0 }

    var dueDateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d 'at' h:mm a"
        return formatter.string(from: dueDate)
    }

    var dueLabel: String {
        if isDueToday { return "Due today" }
        if isDueTomorrow { return "Due tomorrow" }
        if isPastDue {
            let days = abs(daysUntilDue)
            return days == 1 ? "1 day ago" : "\(days) days ago"
        }
        return "in \(daysUntilDue) days"
    }
}
