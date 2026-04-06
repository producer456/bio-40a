import Foundation

class ContentUnlockManager {
    // Course starts Monday April 6, 2026
    static let courseStartDate: Date = {
        var components = DateComponents()
        components.year = 2026
        components.month = 4
        components.day = 6
        return Calendar.current.date(from: components)!
    }()

    static func currentWeek() -> Int {
        let now = Date()
        let days = Calendar.current.dateComponents([.day], from: courseStartDate, to: now).day ?? 0
        return max(1, min(12, (days / 7) + 1))
    }

    static func isWeekUnlocked(_ weekNumber: Int) -> Bool {
        return weekNumber <= currentWeek()
    }

    // For testing/development — unlock all content
    // Set to true during development since the course hasn't started yet
    static var devUnlockAll: Bool {
        get {
            if UserDefaults.standard.object(forKey: "bio40a_devUnlockAll") == nil { return true }
            return UserDefaults.standard.bool(forKey: "bio40a_devUnlockAll")
        }
        set { UserDefaults.standard.set(newValue, forKey: "bio40a_devUnlockAll") }
    }

    static func isUnlocked(_ weekNumber: Int) -> Bool {
        if devUnlockAll { return true }
        // weekNumber 0 means always unlocked (practice exams, etc.)
        if weekNumber == 0 { return true }
        return isWeekUnlocked(weekNumber)
    }

    /// Returns the Monday date when a given week unlocks.
    static func unlockDate(for weekNumber: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: (weekNumber - 1) * 7, to: courseStartDate)!
    }

    /// Returns a formatted string like "Mon, Apr 13" for the unlock date.
    static func unlockDateString(for weekNumber: Int) -> String {
        let date = unlockDate(for: weekNumber)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d"
        return formatter.string(from: date)
    }
}
