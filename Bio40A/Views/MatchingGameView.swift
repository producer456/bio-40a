import SwiftUI

struct MatchingGameView: View {
    let matchingSet: MatchingSet

    @State private var shuffledTerms: [MatchPair] = []
    @State private var shuffledDefinitions: [MatchPair] = []
    @State private var selectedTermId: String? = nil
    @State private var selectedDefId: String? = nil
    @State private var matchedIds: Set<String> = []
    @State private var wrongTermId: String? = nil
    @State private var wrongDefId: String? = nil
    @State private var shakeWrong = false
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var wrongAttempts = 0
    @State private var isComplete = false
    @State private var fadingIds: Set<String> = []

    @Environment(\.dismiss) private var dismiss
    @AppStorage("matchingBestTimes") private var bestTimesData: Data = Data()

    var totalPairs: Int { matchingSet.pairs.count }
    var matchedCount: Int { matchedIds.count }

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            if isComplete {
                completionView
            } else {
                gameView
            }
        }
        .navigationTitle(matchingSet.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Restart") {
                    resetGame()
                }
            }
        }
        .onAppear {
            setupGame()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    // MARK: - Game View

    private var gameView: some View {
        VStack(spacing: 0) {
            // Header bar
            HStack {
                Label(formattedTime, systemImage: "clock.fill")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.secondary)

                Spacer()

                Text("\(matchedCount)/\(totalPairs) matched")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.blue.opacity(0.15))
                        .frame(height: 4)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: geo.size.width * CGFloat(matchedCount) / CGFloat(totalPairs), height: 4)
                        .animation(.easeInOut(duration: 0.3), value: matchedCount)
                }
            }
            .frame(height: 4)

            // Two-column matching area
            ScrollView {
                HStack(alignment: .top, spacing: 10) {
                    // Terms column (left)
                    VStack(spacing: 8) {
                        Text("TERMS")
                            .font(.caption.weight(.bold))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 2)

                        ForEach(shuffledTerms) { pair in
                            termCard(pair: pair)
                        }
                    }

                    // Definitions column (right)
                    VStack(spacing: 8) {
                        Text("DEFINITIONS")
                            .font(.caption.weight(.bold))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 2)

                        ForEach(shuffledDefinitions) { pair in
                            definitionCard(pair: pair)
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 12)
                .padding(.bottom, 30)
            }
        }
    }

    // MARK: - Term Card

    private func termCard(pair: MatchPair) -> some View {
        let isMatched = matchedIds.contains(pair.id)
        let isFading = fadingIds.contains(pair.id)
        let isSelected = selectedTermId == pair.id
        let isWrong = wrongTermId == pair.id

        return Button {
            guard !isMatched, !isFading else { return }
            tapTerm(pair)
        } label: {
            Text(pair.term)
                .font(.subheadline.weight(.medium))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .minimumScaleFactor(0.7)
                .padding(.horizontal, 8)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(termBackground(isMatched: isMatched, isSelected: isSelected, isWrong: isWrong))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(termBorder(isMatched: isMatched, isSelected: isSelected, isWrong: isWrong), lineWidth: isSelected ? 2.5 : 1)
                )
                .foregroundColor(isMatched ? .green : isWrong ? .red : isSelected ? .blue : .primary)
        }
        .buttonStyle(.plain)
        .opacity(isFading ? 0.0 : isMatched ? 0.5 : 1.0)
        .offset(x: isWrong && shakeWrong ? -6 : 0)
        .animation(isWrong && shakeWrong ?
            Animation.linear(duration: 0.06).repeatCount(5, autoreverses: true) :
            .easeInOut(duration: 0.3),
            value: shakeWrong
        )
        .animation(.easeOut(duration: 0.5), value: isFading)
    }

    // MARK: - Definition Card

    private func definitionCard(pair: MatchPair) -> some View {
        let isMatched = matchedIds.contains(pair.id)
        let isFading = fadingIds.contains(pair.id)
        let isSelected = selectedDefId == pair.id
        let isWrong = wrongDefId == pair.id

        return Button {
            guard !isMatched, !isFading else { return }
            tapDefinition(pair)
        } label: {
            Text(pair.definition)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .minimumScaleFactor(0.7)
                .padding(.horizontal, 8)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, minHeight: 52, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(termBackground(isMatched: isMatched, isSelected: isSelected, isWrong: isWrong))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(termBorder(isMatched: isMatched, isSelected: isSelected, isWrong: isWrong), lineWidth: isSelected ? 2.5 : 1)
                )
                .foregroundColor(isMatched ? .green : isWrong ? .red : isSelected ? .blue : .primary)
        }
        .buttonStyle(.plain)
        .opacity(isFading ? 0.0 : isMatched ? 0.5 : 1.0)
        .offset(x: isWrong && shakeWrong ? 6 : 0)
        .animation(isWrong && shakeWrong ?
            Animation.linear(duration: 0.06).repeatCount(5, autoreverses: true) :
            .easeInOut(duration: 0.3),
            value: shakeWrong
        )
        .animation(.easeOut(duration: 0.5), value: isFading)
    }

    // MARK: - Colors

    private func termBackground(isMatched: Bool, isSelected: Bool, isWrong: Bool) -> Color {
        if isMatched { return Color.green.opacity(0.15) }
        if isWrong { return Color.red.opacity(0.15) }
        if isSelected { return Color.blue.opacity(0.12) }
        return Color(.systemBackground)
    }

    private func termBorder(isMatched: Bool, isSelected: Bool, isWrong: Bool) -> Color {
        if isMatched { return .green.opacity(0.5) }
        if isWrong { return .red }
        if isSelected { return .blue }
        return Color(.separator)
    }

    // MARK: - Tap Logic

    private func tapTerm(_ pair: MatchPair) {
        withAnimation(.easeInOut(duration: 0.15)) {
            if selectedTermId == pair.id {
                selectedTermId = nil
            } else {
                selectedTermId = pair.id
            }
        }

        // If both a term and definition are selected, check match
        if let termId = selectedTermId, let defId = selectedDefId {
            checkMatch(termId: termId, defId: defId)
        }
    }

    private func tapDefinition(_ pair: MatchPair) {
        withAnimation(.easeInOut(duration: 0.15)) {
            if selectedDefId == pair.id {
                selectedDefId = nil
            } else {
                selectedDefId = pair.id
            }
        }

        if let termId = selectedTermId, let defId = selectedDefId {
            checkMatch(termId: termId, defId: defId)
        }
    }

    private func checkMatch(termId: String, defId: String) {
        if termId == defId {
            // Correct match
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()

            withAnimation(.easeInOut(duration: 0.3)) {
                matchedIds.insert(termId)
                selectedTermId = nil
                selectedDefId = nil
            }

            // Fade out after a brief moment
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.easeOut(duration: 0.4)) {
                    let _ = fadingIds.insert(termId)
                }
            }

            // Check completion
            if matchedIds.count == totalPairs {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    timer?.invalidate()
                    saveBestTime()
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                        isComplete = true
                    }
                }
            }
        } else {
            // Wrong match
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            wrongAttempts += 1

            withAnimation(.easeInOut(duration: 0.15)) {
                wrongTermId = termId
                wrongDefId = defId
            }

            shakeWrong = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                shakeWrong = false
                withAnimation(.easeInOut(duration: 0.2)) {
                    wrongTermId = nil
                    wrongDefId = nil
                    selectedTermId = nil
                    selectedDefId = nil
                }
            }
        }
    }

    // MARK: - Completion View

    private var completionView: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 72))
                .foregroundStyle(.green)
                .symbolEffect(.bounce, value: isComplete)

            Text("All Matched!")
                .font(.largeTitle.weight(.bold))

            VStack(spacing: 16) {
                HStack(spacing: 32) {
                    statBubble(icon: "clock.fill", value: formattedTime, label: "Time")
                    statBubble(icon: "target", value: "\(totalPairs)/\(totalPairs)", label: "Matched")
                    statBubble(icon: "xmark.circle", value: "\(wrongAttempts)", label: "Mistakes")
                }

                let accuracy = totalPairs > 0 ? Double(totalPairs) / Double(totalPairs + wrongAttempts) * 100 : 0
                Text("Accuracy: \(Int(accuracy))%")
                    .font(.headline)
                    .foregroundColor(accuracy >= 80 ? .green : accuracy >= 60 ? .orange : .red)

                if let best = bestTimeFor(setId: matchingSet.id) {
                    Text("Best time: \(formatTime(best))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
            .shadow(color: .black.opacity(0.08), radius: 8, y: 2)
            .padding(.horizontal)

            Spacer()

            VStack(spacing: 12) {
                Button {
                    resetGame()
                } label: {
                    Label("Play Again", systemImage: "arrow.counterclockwise")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }

                Button {
                    dismiss()
                } label: {
                    Text("Back to Games")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 32)
        }
    }

    private func statBubble(icon: String, value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.blue)
            Text(value)
                .font(.title3.weight(.bold))
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }

    // MARK: - Timer

    private var formattedTime: String {
        formatTime(elapsedTime)
    }

    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

    // MARK: - Game Setup

    private func setupGame() {
        shuffledTerms = matchingSet.pairs.shuffled()
        shuffledDefinitions = matchingSet.pairs.shuffled()
        matchedIds = []
        fadingIds = []
        selectedTermId = nil
        selectedDefId = nil
        wrongTermId = nil
        wrongDefId = nil
        wrongAttempts = 0
        elapsedTime = 0
        isComplete = false

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            elapsedTime += 1
        }
    }

    private func resetGame() {
        withAnimation(.easeInOut(duration: 0.3)) {
            isComplete = false
        }
        setupGame()
    }

    // MARK: - Best Time Persistence

    private func saveBestTime() {
        var times = loadBestTimes()
        let current = times[matchingSet.id] ?? .infinity
        if elapsedTime < current {
            times[matchingSet.id] = elapsedTime
        }
        if let data = try? JSONEncoder().encode(times) {
            bestTimesData = data
        }
    }

    private func bestTimeFor(setId: String) -> TimeInterval? {
        let times = loadBestTimes()
        return times[setId]
    }

    private func loadBestTimes() -> [String: TimeInterval] {
        (try? JSONDecoder().decode([String: TimeInterval].self, from: bestTimesData)) ?? [:]
    }
}
