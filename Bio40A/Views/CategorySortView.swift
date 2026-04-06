import SwiftUI

struct CategorySortView: View {
    let sortSet: CategorySortSet

    @State private var items: [SortItem] = []
    @State private var currentItemIndex = 0
    @State private var correctCount = 0
    @State private var wrongCount = 0
    @State private var answered = false
    @State private var lastCorrect = false
    @State private var lastCorrectCategory = ""
    @State private var highlightedCategory: String? = nil
    @State private var isComplete = false
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer? = nil
    @State private var itemOffset: CGFloat = 0
    @State private var itemOpacity: Double = 1.0

    @Environment(\.dismiss) private var dismiss

    private var currentItem: SortItem? {
        guard currentItemIndex < items.count else { return nil }
        return items[currentItemIndex]
    }

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            if isComplete {
                completionView
            } else if items.isEmpty {
                ProgressView("Loading...")
            } else {
                gameView
            }
        }
        .navigationTitle(sortSet.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Restart") { resetGame() }
            }
        }
        .onAppear { setupGame() }
        .onDisappear { timer?.invalidate() }
    }

    // MARK: - Game View

    private var gameView: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Label(formattedTime, systemImage: "clock.fill")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(currentItemIndex)/\(items.count) sorted")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle().fill(Color.blue.opacity(0.15)).frame(height: 4)
                    Rectangle().fill(Color.blue)
                        .frame(width: geo.size.width * CGFloat(currentItemIndex) / CGFloat(items.count), height: 4)
                        .animation(.easeInOut(duration: 0.3), value: currentItemIndex)
                }
            }
            .frame(height: 4)

            Spacer()

            // Current item card
            if let item = currentItem {
                VStack(spacing: 8) {
                    Text("Sort this item:")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Text(item.name)
                        .font(.title2.weight(.bold))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemBackground))
                        )
                        .shadow(color: .black.opacity(0.1), radius: 8, y: 3)
                        .padding(.horizontal, 20)
                        .offset(y: itemOffset)
                        .opacity(itemOpacity)
                }

                // Feedback
                if answered {
                    VStack(spacing: 4) {
                        HStack {
                            Image(systemName: lastCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(lastCorrect ? .green : .red)
                            Text(lastCorrect ? "Correct!" : "Wrong!")
                                .font(.headline)
                                .foregroundColor(lastCorrect ? .green : .red)
                        }
                        if !lastCorrect {
                            Text("Correct category: \(lastCorrectCategory)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.top, 8)
                    .transition(.scale.combined(with: .opacity))
                }
            }

            Spacer()

            // Score row
            HStack(spacing: 16) {
                Label("\(correctCount) correct", systemImage: "checkmark.circle.fill")
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.green)
                Label("\(wrongCount) wrong", systemImage: "xmark.circle.fill")
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.red)
            }
            .padding(.bottom, 8)

            // Category buckets
            categoryBuckets
                .padding(.horizontal, 12)
                .padding(.bottom, 20)

            if answered {
                Button {
                    nextItem()
                } label: {
                    Text(currentItemIndex + 1 < items.count ? "Next Item" : "See Results")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
        }
    }

    private var categoryBuckets: some View {
        let cols = sortSet.categories.count <= 2 ? 2 : (sortSet.categories.count <= 3 ? 3 : 2)
        let rows = (sortSet.categories.count + cols - 1) / cols

        return VStack(spacing: 10) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<cols, id: \.self) { col in
                        let idx = row * cols + col
                        if idx < sortSet.categories.count {
                            let cat = sortSet.categories[idx]
                            Button {
                                if !answered {
                                    selectCategory(cat)
                                }
                            } label: {
                                Text(cat)
                                    .font(.subheadline.weight(.semibold))
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.7)
                                    .padding(.vertical, 16)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14)
                                            .fill(bucketColor(for: cat))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(bucketBorder(for: cat), lineWidth: 2)
                                    )
                                    .foregroundColor(bucketTextColor(for: cat))
                            }
                            .buttonStyle(.plain)
                            .disabled(answered)
                        }
                    }
                }
            }
        }
    }

    private func bucketColor(for category: String) -> Color {
        if highlightedCategory == category {
            return lastCorrect ? Color.green.opacity(0.2) : Color.red.opacity(0.2)
        }
        return Color(.systemBackground)
    }

    private func bucketBorder(for category: String) -> Color {
        if highlightedCategory == category {
            return lastCorrect ? .green : .red
        }
        if answered, category == lastCorrectCategory, !lastCorrect {
            return .green
        }
        return Color.blue.opacity(0.4)
    }

    private func bucketTextColor(for category: String) -> Color {
        if highlightedCategory == category {
            return lastCorrect ? .green : .red
        }
        return .blue
    }

    // MARK: - Completion View

    private var completionView: some View {
        VStack(spacing: 24) {
            Spacer()

            let accuracy = items.count > 0 ? Double(correctCount) / Double(items.count) * 100 : 0

            Image(systemName: accuracy >= 80 ? "trophy.fill" : "arrow.counterclockwise.circle.fill")
                .font(.system(size: 72))
                .foregroundStyle(accuracy >= 80 ? .yellow : .orange)

            Text("Sorting Complete!")
                .font(.largeTitle.weight(.bold))

            VStack(spacing: 16) {
                HStack(spacing: 24) {
                    statBubble(icon: "clock.fill", value: formattedTime, label: "Time", color: .blue)
                    statBubble(icon: "checkmark.circle.fill", value: "\(correctCount)", label: "Correct", color: .green)
                    statBubble(icon: "xmark.circle.fill", value: "\(wrongCount)", label: "Wrong", color: .red)
                }

                Text("\(Int(accuracy))% Accuracy")
                    .font(.headline)
                    .foregroundColor(accuracy >= 80 ? .green : accuracy >= 60 ? .orange : .red)
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

    private func statBubble(icon: String, value: String, label: String, color: Color) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon).font(.title3).foregroundColor(color)
            Text(value).font(.title3.weight(.bold))
            Text(label).font(.caption).foregroundColor(.secondary)
        }
    }

    // MARK: - Timer

    private var formattedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

    // MARK: - Logic

    private func setupGame() {
        items = sortSet.items.shuffled()
        currentItemIndex = 0
        correctCount = 0
        wrongCount = 0
        answered = false
        lastCorrect = false
        lastCorrectCategory = ""
        highlightedCategory = nil
        isComplete = false
        elapsedTime = 0
        itemOffset = 0
        itemOpacity = 1.0

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            elapsedTime += 1
        }
    }

    private func resetGame() {
        withAnimation { isComplete = false }
        setupGame()
    }

    private func selectCategory(_ category: String) {
        guard let item = currentItem, !answered else { return }

        let correct = (category == item.correctCategory)
        lastCorrect = correct
        lastCorrectCategory = item.correctCategory
        highlightedCategory = category

        if correct {
            correctCount += 1
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } else {
            wrongCount += 1
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }

        withAnimation(.easeInOut(duration: 0.2)) {
            answered = true
        }
    }

    private func nextItem() {
        if currentItemIndex + 1 < items.count {
            // Animate out
            withAnimation(.easeIn(duration: 0.2)) {
                itemOffset = -60
                itemOpacity = 0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                currentItemIndex += 1
                answered = false
                highlightedCategory = nil
                lastCorrectCategory = ""
                itemOffset = 60

                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    itemOffset = 0
                    itemOpacity = 1.0
                }
            }
        } else {
            timer?.invalidate()
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                isComplete = true
            }
        }
    }
}
