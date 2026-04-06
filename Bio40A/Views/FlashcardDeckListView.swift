import SwiftUI

struct FlashcardDeckListView: View {
    @EnvironmentObject var progress: ProgressManager
    @State private var lockedAlertWeek: Int?
    @State private var showLockedAlert = false

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
            .alert("Content Locked", isPresented: $showLockedAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                if let week = lockedAlertWeek {
                    Text("This flashcard deck unlocks in Week \(week) (\(ContentUnlockManager.unlockDateString(for: week)))")
                }
            }
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
                let unlocked = ContentUnlockManager.isUnlocked(deck.weekNumber)

                if unlocked {
                    NavigationLink(destination: FlashcardStudyView(deckId: deck.id)) {
                        FlashcardDeckRow(deck: deck, dueCount: dueCount, isLocked: false)
                    }
                } else {
                    Button {
                        lockedAlertWeek = deck.weekNumber
                        showLockedAlert = true
                    } label: {
                        FlashcardDeckRow(deck: deck, dueCount: dueCount, isLocked: true)
                    }
                    .buttonStyle(.plain)
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
    var isLocked: Bool = false

    var body: some View {
        HStack(spacing: 14) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isLocked ? Color.gray.opacity(0.15) : Color.orange.opacity(0.15))
                    .frame(width: 48, height: 48)

                Image(systemName: isLocked ? "lock.fill" : "rectangle.stack.fill")
                    .font(.title3)
                    .foregroundColor(isLocked ? .gray : .orange)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(deck.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(isLocked ? .secondary : .primary)

                HStack(spacing: 10) {
                    Label("\(deck.cardCount) cards", systemImage: "square.stack")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    if !deck.category.isEmpty {
                        Text(deck.category)
                            .font(.caption)
                            .foregroundColor(isLocked ? .secondary : .blue)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(
                                Capsule()
                                    .fill(isLocked ? Color.gray.opacity(0.1) : Color.blue.opacity(0.1))
                            )
                    }
                }
            }

            Spacer()

            if isLocked {
                Image(systemName: "lock.fill")
                    .foregroundColor(.secondary)
                    .font(.caption)
            } else if dueCount > 0 {
                // Due badge
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
        .opacity(isLocked ? 0.6 : 1.0)
    }
}

#Preview {
    FlashcardDeckListView()
        .environmentObject(ProgressManager())
}
