import SwiftUI

@main
struct Bio40AApp: App {
    @StateObject private var progressManager = ProgressManager()
    @StateObject private var notificationManager = NotificationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressManager)
                .environmentObject(notificationManager)
                .onAppear {
                    notificationManager.checkPermissionStatus()
                    if notificationManager.isEnabled {
                        notificationManager.scheduleDailyReminder()
                    }
                }
        }
    }
}
