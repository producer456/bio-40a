import SwiftUI

struct FlashcardStudyView: View {
    @EnvironmentObject var progress: ProgressManager
    @Environment(\.dismiss) private var dismiss

    let deckId: String

    @State private var dueCards: [Flashcard] = []
    @State private var currentIndex = 0
    @State private var isFlipped = false
    @State private var reviewedCount = 0
    @State private var isFinished = false

    private var deck: FlashcardDeck? {
        progress.flashcardDecks.first(where: { $0.id == deckId })
    }

    private var currentCard: Flashcard? {
        guard currentIndex < dueCards.count else { return nil }
        return dueCards[currentIndex]
    }

    private var progressFraction: Double {
        guard !dueCards.isEmpty else { return 0 }
        return Double(reviewedCount) / Double(dueCards.count)
    }

    var body: some View {
        VStack(spacing: 0) {
            if isFinished || dueCards.isEmpty {
                summaryView
            } else {
                studyView
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(deck?.title ?? "Flashcards")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadDueCards()
        }
    }

    // MARK: - Study View

    private var studyView: some View {
        VStack(spacing: 16) {
            // Progress bar
            VStack(spacing: 6) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.orange.opacity(0.15))
                            .frame(height: 4)

                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.orange)
                            .frame(width: geo.size.width * progressFraction, height: 4)
                            .animation(.easeInOut, value: reviewedCount)
                    }
                }
                .frame(height: 4)

                HStack {
                    Text("\(reviewedCount) of \(dueCards.count) reviewed")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("Card \(currentIndex + 1)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)

            Spacer()

            // Flashcard
            if let card = currentCard {
                flashcardView(card: card)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            isFlipped.toggle()
                        }
                    }
            }

            Spacer()

            // Hint
            if !isFlipped, let hint = currentCard?.hint, !hint.isEmpty {
                HStack(spacing: 4) {
                    Image(systemName: "lightbulb.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                    Text("Hint: \(hint)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .padding(.horizontal)
            }

            // Tap instruction or rating buttons
            if isFlipped {
                ratingButtons
            } else {
                Text("Tap card to reveal answer")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 4)
            }
        }
    }

    // MARK: - Flashcard with 3D Flip

    private func flashcardView(card: Flashcard) -> some View {
        ZStack {
            // Back side
            cardSide(text: card.back, isBack: true)
                .rotation3DEffect(
                    .degrees(isFlipped ? 0 : 180),
                    axis: (x: 0, y: 1, z: 0)
                )
                .opacity(isFlipped ? 1 : 0)

            // Front side
            cardSide(text: card.front, isBack: false)
                .rotation3DEffect(
                    .degrees(isFlipped ? -180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
                .opacity(isFlipped ? 0 : 1)
        }
        .padding(.horizontal)
    }

    private func cardSide(text: String, isBack: Bool) -> some View {
        VStack(spacing: 12) {
            Text(isBack ? "ANSWER" : "QUESTION")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(isBack ? .green : .blue)
                .tracking(1)

            Spacer()

            Text(text)
                .font(.title3)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal)

            Spacer()

            Image(systemName: isBack ? "arrow.uturn.backward" : "hand.tap.fill")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .frame(height: 320)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 12, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isBack ? Color.green.opacity(0.3) : Color.blue.opacity(0.3), lineWidth: 2)
        )
    }

    // MARK: - Rating Buttons

    private var ratingButtons: some View {
        HStack(spacing: 10) {
            ForEach(CardRating.allCases, id: \.rawValue) { rating in
                Button {
                    rateCard(rating)
                } label: {
                    VStack(spacing: 4) {
                        Text(rating.label)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(ratingColor(rating).opacity(0.15))
                    )
                    .foregroundColor(ratingColor(rating))
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    private func ratingColor(_ rating: CardRating) -> Color {
        switch rating {
        case .again: return .red
        case .hard: return .orange
        case .good: return .blue
        case .easy: return .green
        }
    }

    // MARK: - Summary View

    private var summaryView: some View {
        VStack(spacing: 24) {
            Spacer()

            if dueCards.isEmpty && reviewedCount == 0 {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.green)

                Text("All Caught Up!")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("No cards are due for review right now.\nCheck back later!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            } else {
                Image(systemName: "star.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.orange)

                Text("Session Complete!")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("You reviewed \(reviewedCount) card\(reviewedCount == 1 ? "" : "s")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // Stats
                HStack(spacing: 30) {
                    VStack(spacing: 4) {
                        Text("\(reviewedCount)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        Text("Reviewed")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    VStack(spacing: 4) {
                        Text("\(deck?.cardCount ?? 0)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Text("Total Cards")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
                )
            }

            Spacer()

            Button {
                dismiss()
            } label: {
                Text("Done")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.blue)
                    )
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
        }
    }

    // MARK: - Actions

    private func loadDueCards() {
        dueCards = progress.dueCards(in: deckId)
        currentIndex = 0
        reviewedCount = 0
        isFlipped = false
        isFinished = false
    }

    private func rateCard(_ rating: CardRating) {
        guard let card = currentCard else { return }
        progress.updateFlashcard(deckId: deckId, cardId: card.id, rating: rating)
        reviewedCount += 1

        if currentIndex < dueCards.count - 1 {
            withAnimation {
                currentIndex += 1
                isFlipped = false
            }
        } else {
            withAnimation {
                isFinished = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        FlashcardStudyView(deckId: "preview")
    }
    .environmentObject(ProgressManager())
}
