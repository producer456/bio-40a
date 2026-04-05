import Foundation
import UserNotifications
import SwiftUI

class NotificationManager: ObservableObject {
    static let shared = NotificationManager()

    @Published var isEnabled: Bool {
        didSet { UserDefaults.standard.set(isEnabled, forKey: Keys.isEnabled) }
    }
    @Published var reminderTime: Date {
        didSet {
            UserDefaults.standard.set(reminderTime.timeIntervalSince1970, forKey: Keys.reminderTime)
            if isEnabled { scheduleDailyReminder() }
        }
    }
    @Published var flashcardReminders: Bool {
        didSet { UserDefaults.standard.set(flashcardReminders, forKey: Keys.flashcardReminders) }
    }

    private enum Keys {
        static let isEnabled = "bio40a_notifications_enabled"
        static let reminderTime = "bio40a_reminder_time"
        static let flashcardReminders = "bio40a_flashcard_reminders"
    }

    private let dailyReminderID = "bio40a_daily_reminder"
    private let flashcardReminderID = "bio40a_flashcard_reminder"

    private let motivationalMessages = [
        "Time to study! Your Bio 40A flashcards are waiting.",
        "Keep your streak alive! Open Bio 40A to study.",
        "Quiz prep time! Review your A&P notes.",
        "Don't forget your pre-lecture work is due!"
    ]

    init() {
        // Load saved settings
        let defaults = UserDefaults.standard
        self.isEnabled = defaults.bool(forKey: Keys.isEnabled)
        self.flashcardReminders = defaults.object(forKey: Keys.flashcardReminders) as? Bool ?? true

        // Default reminder time: 8 PM today
        if let savedInterval = defaults.object(forKey: Keys.reminderTime) as? TimeInterval {
            self.reminderTime = Date(timeIntervalSince1970: savedInterval)
        } else {
            var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
            components.hour = 20
            components.minute = 0
            self.reminderTime = Calendar.current.date(from: components) ?? Date()
        }
    }

    // MARK: - Permission

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, error in
            DispatchQueue.main.async {
                if granted {
                    self?.isEnabled = true
                    self?.scheduleDailyReminder()
                } else {
                    self?.isEnabled = false
                }
            }
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }

    /// Checks current authorization status and updates isEnabled accordingly.
    func checkPermissionStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            DispatchQueue.main.async {
                if settings.authorizationStatus == .denied {
                    self?.isEnabled = false
                }
            }
        }
    }

    // MARK: - Daily Reminder

    func scheduleDailyReminder() {
        let center = UNUserNotificationCenter.current()

        // Remove existing daily reminder
        center.removePendingNotificationRequests(withIdentifiers: [dailyReminderID])

        guard isEnabled else { return }

        let content = UNMutableNotificationContent()
        content.title = "Bio 40A"
        content.body = motivationalMessages.randomElement() ?? motivationalMessages[0]
        content.sound = .default

        // Extract hour and minute from the user-chosen time
        let timeComponents = Calendar.current.dateComponents([.hour, .minute], from: reminderTime)
        var dateComponents = DateComponents()
        dateComponents.hour = timeComponents.hour
        dateComponents.minute = timeComponents.minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: dailyReminderID, content: content, trigger: trigger)

        center.add(request) { error in
            if let error = error {
                print("Failed to schedule daily reminder: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Flashcard Reminders

    func scheduleFlashcardReminder(dueCount: Int) {
        let center = UNUserNotificationCenter.current()

        // Remove existing flashcard reminder
        center.removePendingNotificationRequests(withIdentifiers: [flashcardReminderID])

        guard flashcardReminders, dueCount > 0 else { return }

        let content = UNMutableNotificationContent()
        content.title = "Flashcards Due"
        content.body = "You have \(dueCount) flashcard\(dueCount == 1 ? "" : "s") ready for review. Keep up the spaced repetition!"
        content.sound = .default

        // Fire 30 minutes from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30 * 60, repeats: false)
        let request = UNNotificationRequest(identifier: flashcardReminderID, content: content, trigger: trigger)

        center.add(request) { error in
            if let error = error {
                print("Failed to schedule flashcard reminder: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Cancel

    func cancelAll() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        center.removeAllDeliveredNotifications()
    }
}
