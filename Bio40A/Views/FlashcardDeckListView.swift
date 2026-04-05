import SwiftUI

struct FlashcardDeckListView: View {
    @EnvironmentObject var progress: ProgressManager

    var body: some View {
        NavigationStack {
            Group {
                if progress.flashcardDecks.isEmpty {
                    emptyState
                } else {
                    deckList
                }
            }
            .navigationTitle("Flashcards")
            .background(Color(.systemGroupedBackground))
        }
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "rectangle.on.rectangle.angled")
                .font(.system(size: 50))
                .foregroundColor(.orange.opacity(0.5))
            Text("No Flashcard Decks")
                .font(.title3)
                .fontWeight(.medium)
            Text("Flashcard decks will appear here once course content is loaded.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(40)
    }

    private var deckList: some View {
        List {
            ForEach(progress.flashcardDecks) { deck in
                let dueCount = progress.dueCards(in: deck.id).count

                NavigationLink(destination: FlashcardStudyView(deckId: deck.id)) {
                    FlashcardDeckRow(deck: deck, dueCount: dueCount)
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

// MARK: - Deck Row

struct FlashcardDeckRow: View {
    let deck: FlashcardDeck
    let dueCount: Int

    var body: some View {
        HStack(spacing: 14) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.orange.opacity(0.15))
                    .frame(width: 48, height: 48)

                Image(systemName: "rectangle.stack.fill")
                    .font(.title3)
                    .foregroundColor(.orange)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(deck.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                HStack(spacing: 10) {
                    Label("\(deck.cardCount) cards", systemImage: "square.stack")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    if !deck.category.isEmpty {
                        Text(deck.category)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(
                                Capsule()
                                    .fill(Color.blue.opacity(0.1))
                            )
                    }
                }
            }

            Spacer()

            // Due badge
            if dueCount > 0 {
                Text("\(dueCount)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.orange)
                    )
            } else {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    FlashcardDeckListView()
        .environmentObject(ProgressManager())
}
