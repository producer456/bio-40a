import SwiftUI

struct QuickReviewView: View {
    @EnvironmentObject var progress: ProgressManager
    @Environment(\.dismiss) private var dismiss

    private let timerLimit: Double = 15.0

    @State private var cards: [(deckId: String, card: Flashcard)] = []
    @State private var currentIndex = 0
    @State private var knownCount = 0
    @State private var unknownCount = 0
    @State private var isFinished = false
    @State private var sessionStart = Date()

    // Timer
    @State private var timeRemaining: Double = 15.0
    @State private var timer: Timer?
    @State private var isTransitioning = false

    private var currentCard: Flashcard? {
        guard currentIndex < cards.count else { return nil }
        return cards[currentIndex].card
    }

    private var cardProgress: Double {
        guard !cards.isEmpty else { return 0 }
        return Double(currentIndex) / Double(cards.count)
    }

    private var timerFraction: Double {
        timeRemaining / timerLimit
    }

    var body: some View {
        VStack(spacing: 0) {
            if isFinished || cards.isEmpty {
                summaryView
            } else {
                gameView
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Quick Review")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadCards()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    // MARK: - Game View

    private var gameView: some View {
        VStack(spacing: 16) {
            // Card progress bar
            VStack(spacing: 6) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.blue.opacity(0.15))
                            .frame(height: 6)

                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.blue)
                            .frame(width: geo.size.width * cardProgress, height: 6)
                            .animation(.easeInOut(duration: 0.3), value: currentIndex)
                    }
                }
                .frame(height: 6)

                HStack {
                    Text("\(currentIndex + 1) of \(cards.count)")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)

                    Spacer()

                    HStack(spacing: 10) {
                        Label("\(knownCount)", systemImage: "checkmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.green)
                        Label("\(unknownCount)", systemImage: "xmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)

            // Countdown timer bar
            VStack(spacing: 4) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.15))
                            .frame(height: 8)

                        RoundedRectangle(cornerRadius: 4)
                            .fill(timerColor)
                            .frame(width: geo.size.width * max(0, timerFraction), height: 8)
                            .animation(.linear(duration: 0.1), value: timeRemaining)
                    }
                }
                .frame(height: 8)

                Text(String(format: "%.1fs", max(0, timeRemaining)))
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(timerColor)
                    .monospacedDigit()
            }
            .padding(.horizontal)

            Spacer()

            // Card front
            if let card = currentCard {
                VStack(spacing: 16) {
                    Text("QUESTION")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .tracking(1)

                    Spacer()

                    Text(card.front)
                        .font(.title3)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal)

                    Spacer()

                    if let hint = card.hint, !hint.isEmpty {
                        HStack(spacing: 4) {
                            Image(systemName: "lightbulb.fill")
                                .font(.caption)
                                .foregroundColor(.yellow)
                            Text(hint)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .italic()
                        }
                    }
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .frame(height: 280)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.1), radius: 12, y: 4)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(timerColor.opacity(0.4), lineWidth: 2)
                )
                .padding(.horizontal)
            }

            Spacer()

            // Action buttons
            HStack(spacing: 16) {
                Button {
                    markUnknown()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "xmark")
                            .fontWeight(.bold)
                        Text("Don't Know")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.red.opacity(0.15))
                    )
                    .foregroundColor(.red)
                }

                Button {
                    markKnown()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                        Text("Know It")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.green.opacity(0.15))
                    )
                    .foregroundColor(.green)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
        }
    }

    private var timerColor: Color {
        if timeRemaining > 10 { return .green }
        if timeRemaining > 5 { return .orange }
        return .red
    }

    // MARK: - Summary View

    private var summaryView: some View {
        VStack(spacing: 24) {
            Spacer()

            if cards.isEmpty && knownCount == 0 && unknownCount == 0 {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.green)

                Text("No Cards Due")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("All your flashcards are up to date.\nCheck back later!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            } else {
                Image(systemName: "bolt.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)

                Text("Quick Review Complete!")
                    .font(.title2)
                    .fontWeight(.bold)

                let totalTime = Date().timeIntervalSince(sessionStart)
                let totalCards = knownCount + unknownCount

                Text("You reviewed \(totalCards) card\(totalCards == 1 ? "" : "s") in \(formattedTime(totalTime))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                // Stats
                HStack(spacing: 24) {
                    VStack(spacing: 4) {
                        Text("\(knownCount)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        Text("Known")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    // Divider
                    Rectangle()
                        .fill(Color.secondary.opacity(0.3))
                        .frame(width: 1, height: 40)

                    VStack(spacing: 4) {
                        Text("\(unknownCount)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Text("Don't Know")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }

                    Rectangle()
                        .fill(Color.secondary.opacity(0.3))
                        .frame(width: 1, height: 40)

                    VStack(spacing: 4) {
                        Text(formattedTime(totalTime))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Text("Time")
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

                if totalCards > 0 {
                    let pct = Double(knownCount) / Double(totalCards) * 100
                    Text(String(format: "%.0f%% recall rate", pct))
                        .font(.headline)
                        .foregroundColor(pct >= 70 ? .green : (pct >= 50 ? .orange : .red))
                }
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

    private func loadCards() {
        cards = progress.allDueCards()
        currentIndex = 0
        knownCount = 0
        unknownCount = 0
        isFinished = false
        sessionStart = Date()
        startTimer()
    }

    private func startTimer() {
        timeRemaining = timerLimit
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            DispatchQueue.main.async {
                guard !isTransitioning else { return }
                if timeRemaining > 0 {
                    timeRemaining -= 0.1
                } else {
                    // Auto-mark as unknown
                    markUnknown()
                }
            }
        }
    }

    private func markKnown() {
        guard !isTransitioning, currentIndex < cards.count else { return }
        isTransitioning = true
        let entry = cards[currentIndex]
        progress.updateFlashcard(deckId: entry.deckId, cardId: entry.card.id, rating: .good)
        knownCount += 1
        advanceCard()
    }

    private func markUnknown() {
        guard !isTransitioning, currentIndex < cards.count else { return }
        isTransitioning = true
        let entry = cards[currentIndex]
        progress.updateFlashcard(deckId: entry.deckId, cardId: entry.card.id, rating: .again)
        unknownCount += 1
        advanceCard()
    }

    private func advanceCard() {
        timer?.invalidate()
        if currentIndex < cards.count - 1 {
            withAnimation(.easeInOut(duration: 0.25)) {
                currentIndex += 1
            }
            isTransitioning = false
            startTimer()
        } else {
            withAnimation {
                isFinished = true
            }
            isTransitioning = false
        }
    }

    private func formattedTime(_ seconds: TimeInterval) -> String {
        let mins = Int(seconds) / 60
        let secs = Int(seconds) % 60
        if mins > 0 {
            return "\(mins)m \(secs)s"
        }
        return "\(secs)s"
    }
}

#Preview {
    NavigationStack {
        QuickReviewView()
    }
    .environmentObject(ProgressManager())
}
