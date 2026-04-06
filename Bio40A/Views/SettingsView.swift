import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var progress: ProgressManager
    @EnvironmentObject var notificationManager: NotificationManager

    @State private var showResetConfirmation = false
    @State private var showResetSuccess = false
    @State private var devUnlockAll = ContentUnlockManager.devUnlockAll

    var body: some View {
        NavigationStack {
            Form {
                notificationsSection
                contentUnlockSection
                resourcesSection
                dataSection
                aboutSection
            }
            .navigationTitle("Settings")
            .alert("Reset All Progress?", isPresented: $showResetConfirmation) {
                Button("Cancel", role: .cancel) {}
                Button("Reset", role: .destructive) {
                    progress.resetAllProgress()
                    showResetSuccess = true
                }
            } message: {
                Text("This will permanently delete all your study progress, quiz scores, flashcard history, bookmarks, and notes. This action cannot be undone.")
            }
            .alert("Progress Reset", isPresented: $showResetSuccess) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("All progress has been reset to default.")
            }
        }
    }

    // MARK: - Content Unlock Section

    private var contentUnlockSection: some View {
        Section {
            Toggle(isOn: $devUnlockAll) {
                Label("Unlock All Content (Dev Mode)", systemImage: "lock.open.fill")
            }
            .onChange(of: devUnlockAll) { _, newValue in
                ContentUnlockManager.devUnlockAll = newValue
            }

            if !devUnlockAll {
                HStack {
                    Text("Current Week")
                    Spacer()
                    Text("Week \(ContentUnlockManager.currentWeek())")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Course Start")
                    Spacer()
                    Text("Mon, Apr 6, 2026")
                        .foregroundColor(.secondary)
                }
            }
        } header: {
            Text("Content Schedule")
        } footer: {
            Text(devUnlockAll
                 ? "All weeks are unlocked for studying ahead. Turn off to follow the course schedule."
                 : "Content unlocks weekly according to the syllabus schedule. Enable Dev Mode to access all content.")
        }
    }

    // MARK: - Notifications Section

    private var notificationsSection: some View {
        Section {
            Toggle(isOn: $notificationManager.isEnabled) {
                Label("Daily Study Reminder", systemImage: "bell.fill")
            }
            .onChange(of: notificationManager.isEnabled) { _, newValue in
                if newValue {
                    notificationManager.requestPermission()
                } else {
                    notificationManager.cancelAll()
                }
            }

            if notificationManager.isEnabled {
                DatePicker(
                    selection: $notificationManager.reminderTime,
                    displayedComponents: .hourAndMinute
                ) {
                    Label("Reminder Time", systemImage: "clock.fill")
                }
            }

            Toggle(isOn: $notificationManager.flashcardReminders) {
                Label("Flashcard Due Alerts", systemImage: "rectangle.on.rectangle.angled")
            }
        } header: {
            Text("Notifications")
        } footer: {
            Text("Daily reminders help you maintain your study streak. Flashcard alerts notify you when cards are ready for review.")
        }
    }

    // MARK: - Resources Section

    private var resourcesSection: some View {
        Section {
            Link(destination: URL(string: "https://openstax.org/details/books/anatomy-and-physiology-2e")!) {
                HStack {
                    Label("OpenStax A&P Textbook", systemImage: "book.closed.fill")
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "arrow.up.right.square")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        } header: {
            Text("Resources")
        }
    }

    // MARK: - Data Section

    private var dataSection: some View {
        Section {
            Button(role: .destructive) {
                showResetConfirmation = true
            } label: {
                Label("Reset All Progress", systemImage: "trash.fill")
            }
        } header: {
            Text("Data")
        } footer: {
            Text("Resetting will clear all lesson completions, quiz scores, flashcard progress, bookmarks, and notes.")
        }
    }

    // MARK: - About Section

    private var aboutSection: some View {
        Section {
            HStack {
                Text("App")
                Spacer()
                Text("Bio 40A Study Guide")
                    .foregroundColor(.secondary)
            }

            HStack {
                Text("Version")
                Spacer()
                Text(appVersion)
                    .foregroundColor(.secondary)
            }

            HStack {
                Text("Course")
                Spacer()
                Text("Human Anatomy & Physiology")
                    .foregroundColor(.secondary)
            }
        } header: {
            Text("About")
        }
    }

    // MARK: - Helpers

    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "\(version) (\(build))"
    }
}

#Preview {
    SettingsView()
        .environmentObject(ProgressManager())
        .environmentObject(NotificationManager())
}
