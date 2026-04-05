import SwiftUI

@main
struct Bio40AApp: App {
    @StateObject private var progressManager = ProgressManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressManager)
        }
    }
}
