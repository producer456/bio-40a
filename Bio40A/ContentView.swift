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

            AssignmentListView()
                .tabItem {
                    Label("Due Dates", systemImage: "calendar.badge.clock")
                }
                .tag(1)

            LessonListView()
                .tabItem {
                    Label("Lessons", systemImage: "book.fill")
                }
                .tag(2)

            QuizListView()
                .tabItem {
                    Label("Quizzes", systemImage: "checkmark.circle.fill")
                }
                .tag(3)

            DiagramsView()
                .tabItem {
                    Label("Diagrams", systemImage: "figure.stand")
                }
                .tag(4)

            FlashcardDeckListView()
                .tabItem {
                    Label("Flashcards", systemImage: "rectangle.on.rectangle.angled")
                }
                .tag(5)

            BookmarksView()
                .tabItem {
                    Label("Bookmarks", systemImage: "star.fill")
                }
                .tag(6)

            StudyProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
                .tag(7)
        }
        .accentColor(.blue)
    }
}
