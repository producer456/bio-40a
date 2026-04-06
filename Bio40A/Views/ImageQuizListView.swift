import SwiftUI

struct ImageQuizListView: View {
    private let quizSets = ImageQuizData.quizSets

    var body: some View {
        List {
            Section {
                Text("Test your knowledge by identifying structures in diagrams drawn from course material.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 8, trailing: 16))
            }

            Section {
                ForEach(quizSets) { quizSet in
                    NavigationLink(destination: ImageQuizView(quizSet: quizSet)) {
                        ImageQuizRow(quizSet: quizSet)
                    }
                }
            } header: {
                Label("Topics", systemImage: "square.grid.2x2")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.teal)
                    .textCase(nil)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Visual Quizzes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Row

struct ImageQuizRow: View {
    let quizSet: ImageQuizSet

    private var accentColor: Color {
        switch quizSet.diagramType.accentColor {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "purple": return .purple
        case "red": return .red
        case "teal": return .teal
        case "indigo": return .indigo
        default: return .blue
        }
    }

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(accentColor.opacity(0.15))
                    .frame(width: 48, height: 48)

                Image(systemName: quizSet.diagramType.iconName)
                    .font(.title3)
                    .foregroundColor(accentColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(quizSet.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Label("\(quizSet.questionCount) questions", systemImage: "photo.on.rectangle")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        ImageQuizListView()
    }
}
