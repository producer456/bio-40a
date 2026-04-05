import SwiftUI

struct ContentView: View {
    @EnvironmentObject var progress: ProgressManager
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)

            LessonListView()
                .tabItem {
                    Label("Lessons", systemImage: "book.fill")
                }
                .tag(1)

            QuizListView()
                .tabItem {
                    Label("Quizzes", systemImage: "checkmark.circle.fill")
                }
                .tag(2)

            FlashcardDeckListView()
                .tabItem {
                    Label("Flashcards", systemImage: "rectangle.on.rectangle.angled")
                }
                .tag(3)

            StudyProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
                .tag(4)
        }
        .accentColor(.blue)
    }
}
