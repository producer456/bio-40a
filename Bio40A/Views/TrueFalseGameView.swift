import SwiftUI

struct TrueFalseGameView: View {
    let weekFilter: Int? // nil = all weeks

    @State private var statements: [TrueFalseStatement] = []
    @State private var currentIndex = 0
    @State private var score = 0
    @State private var streak = 0
    @State private var bestStreak = 0
    @State private var answered = false
    @State private var lastCorrect = false
    @State private var isComplete = false
    @State private var timeRemaining: Double = 5.0
    @State private var timer: Timer? = nil
    @State private var cardOffset: CGFloat = 0
    @State private var cardRotation: Double = 0
    @State private var cardOpacity: Double = 1.0
    @State private var showExplanation = false

    @AppStorage("trueFalseHighScore") private var highScore: Int = 0
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            if isComplete {
                completionView
            } else if statements.isEmpty {
                ProgressView("Loading statements...")
            } else {
                gameView
            }
        }
        .navigationTitle("True or False")
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
                Label("\(currentIndex + 1)/\(statements.count)", systemImage: "number")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.secondary)

                Spacer()

                // Streak
                if streak > 0 {
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(.orange)
                        Text("\(streak)")
                            .font(.subheadline.weight(.bold))
                            .foregroundColor(.orange)
                    }
                }

                Spacer()

                Label("\(score)", systemImage: "star.fill")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)

            // Timer bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle().fill(Color.gray.opacity(0.2)).frame(height: 6)
                    Rectangle()
                        .fill(timerColor)
                        .frame(width: geo.size.width * CGFloat(timeRemaining / 5.0), height: 6)
                        .animation(.linear(duration: 0.1), value: timeRemaining)
                }
            }
            .frame(height: 6)

            Spacer()

            // Card
            VStack(spacing: 20) {
                // Week badge
                Text("Week \(statements[currentIndex].weekNumber)")
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.blue.opacity(0.15)))
                    .foregroundColor(.blue)

                Text(statements[currentIndex].statement)
                    .font(.title3.weight(.medium))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 28)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemBackground))
                    )
                    .shadow(color: .black.opacity(0.1), radius: 10, y: 4)
                    .padding(.horizontal, 20)
                    .offset(x: cardOffset)
                    .rotationEffect(.degrees(cardRotation))
                    .opacity(cardOpacity)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !answered {
                                    cardOffset = value.translation.width
                                    cardRotation = Double(value.translation.width / 20)
                                }
                            }
                            .onEnded { value in
                                if !answered {
                                    if value.translation.width > 80 {
                                        answerTrue()
                                    } else if value.translation.width < -80 {
                                        answerFalse()
                                    } else {
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                            cardOffset = 0
                                            cardRotation = 0
                                        }
                                    }
                                }
                            }
                    )

                // Explanation
                if showExplanation {
                    VStack(spacing: 8) {
                        HStack {
                            Image(systemName: lastCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(lastCorrect ? .green : .red)
                            Text(lastCorrect ? "Correct!" : "Wrong!")
                                .font(.headline)
                                .foregroundColor(lastCorrect ? .green : .red)
                        }
                        Text(statements[currentIndex].explanation)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemGroupedBackground)))
                    .padding(.horizontal, 20)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }

                // Swipe hints
                if !answered {
                    HStack {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.left")
                            Text("FALSE")
                        }
                        .font(.caption.weight(.bold))
                        .foregroundColor(.red.opacity(0.6))

                        Spacer()

                        HStack(spacing: 4) {
                            Text("TRUE")
                            Image(systemName: "arrow.right")
                        }
                        .font(.caption.weight(.bold))
                        .foregroundColor(.green.opacity(0.6))
                    }
                    .padding(.horizontal, 40)
                }
            }

            Spacer()

            // Buttons
            if !answered {
                HStack(spacing: 20) {
                    Button {
                        answerFalse()
                    } label: {
                        HStack {
                            Image(systemName: "xmark")
                                .font(.title2.weight(.bold))
                            Text("FALSE")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                    }

                    Button {
                        answerTrue()
                    } label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .font(.title2.weight(.bold))
                            Text("TRUE")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
            } else {
                Button {
                    nextStatement()
                } label: {
                    Text(currentIndex + 1 < statements.count ? "Next" : "See Results")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
            }

            Spacer().frame(height: 16)
        }
    }

    // MARK: - Completion View

    private var completionView: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: score > statements.count / 2 ? "trophy.fill" : "arrow.counterclockwise.circle.fill")
                .font(.system(size: 72))
                .foregroundStyle(score > statements.count / 2 ? .yellow : .orange)

            Text("Speed Round Complete!")
                .font(.largeTitle.weight(.bold))

            VStack(spacing: 16) {
                HStack(spacing: 24) {
                    statBubble(icon: "star.fill", value: "\(score)/\(statements.count)", label: "Score", color: .yellow)
                    statBubble(icon: "flame.fill", value: "\(bestStreak)", label: "Best Streak", color: .orange)
                }

                let pct = statements.count > 0 ? Double(score) / Double(statements.count) * 100 : 0
                Text("\(Int(pct))% Accuracy")
                    .font(.headline)
                    .foregroundColor(pct >= 80 ? .green : pct >= 60 ? .orange : .red)

                if score > highScore {
                    Text("New High Score!")
                        .font(.headline.weight(.bold))
                        .foregroundColor(.yellow)
                }

                Text("High Score: \(highScore)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
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

    private var timerColor: Color {
        if timeRemaining > 3 { return .green }
        if timeRemaining > 1.5 { return .orange }
        return .red
    }

    private func startTimer() {
        timeRemaining = 5.0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 0.1
            } else {
                timer?.invalidate()
                // Time's up = wrong
                handleAnswer(userSaidTrue: !statements[currentIndex].isTrue)
            }
        }
    }

    // MARK: - Logic

    private func setupGame() {
        var pool: [TrueFalseStatement]
        if let week = weekFilter {
            pool = TrueFalseData.allStatements.filter { $0.weekNumber == week }
        } else {
            pool = TrueFalseData.allStatements
        }
        statements = pool.shuffled()
        currentIndex = 0
        score = 0
        streak = 0
        bestStreak = 0
        answered = false
        lastCorrect = false
        isComplete = false
        showExplanation = false
        cardOffset = 0
        cardRotation = 0
        cardOpacity = 1.0
        startTimer()
    }

    private func resetGame() {
        withAnimation { isComplete = false }
        setupGame()
    }

    private func answerTrue() {
        guard !answered else { return }
        // Fly card right
        withAnimation(.easeInOut(duration: 0.3)) {
            cardOffset = 400
            cardRotation = 15
        }
        handleAnswer(userSaidTrue: true)
    }

    private func answerFalse() {
        guard !answered else { return }
        // Fly card left
        withAnimation(.easeInOut(duration: 0.3)) {
            cardOffset = -400
            cardRotation = -15
        }
        handleAnswer(userSaidTrue: false)
    }

    private func handleAnswer(userSaidTrue: Bool) {
        timer?.invalidate()
        answered = true
        let correct = (userSaidTrue == statements[currentIndex].isTrue)
        lastCorrect = correct

        if correct {
            score += 1
            streak += 1
            if streak > bestStreak { bestStreak = streak }
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        } else {
            streak = 0
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }

        // Show card again centered with explanation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                cardOffset = 0
                cardRotation = 0
                cardOpacity = 1.0
                showExplanation = true
            }
        }
    }

    private func nextStatement() {
        if currentIndex + 1 < statements.count {
            withAnimation(.easeInOut(duration: 0.2)) {
                showExplanation = false
                answered = false
                cardOffset = 0
                cardRotation = 0
                cardOpacity = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                currentIndex += 1
                startTimer()
            }
        } else {
            if score > highScore { highScore = score }
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                isComplete = true
            }
        }
    }
}
