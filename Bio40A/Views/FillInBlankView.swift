import SwiftUI

struct FillInBlankView: View {
    let weekFilter: Int? // nil = all weeks

    @State private var questions: [FillInBlankQuestion] = []
    @State private var currentIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    @State private var answered = false
    @State private var isCorrect = false
    @State private var isComplete = false
    @State private var flashColor: Color = .clear
    @State private var results: [(question: FillInBlankQuestion, userAnswer: String, correct: Bool)] = []

    @Environment(\.dismiss) private var dismiss
    @FocusState private var isTextFieldFocused: Bool

    private let questionsPerRound = 15

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            if isComplete {
                completionView
            } else if questions.isEmpty {
                ProgressView("Loading questions...")
            } else {
                gameView
            }
        }
        .navigationTitle("Fill in the Blank")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Restart") { resetGame() }
            }
        }
        .onAppear { setupGame() }
    }

    // MARK: - Game View

    private var gameView: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Question \(currentIndex + 1)/\(questions.count)")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.secondary)
                Spacer()
                Label("\(score) correct", systemImage: "checkmark.circle.fill")
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.green)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)

            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle().fill(Color.blue.opacity(0.15)).frame(height: 4)
                    Rectangle().fill(Color.blue)
                        .frame(width: geo.size.width * CGFloat(currentIndex) / CGFloat(questions.count), height: 4)
                        .animation(.easeInOut(duration: 0.3), value: currentIndex)
                }
            }
            .frame(height: 4)

            ScrollView {
                VStack(spacing: 24) {
                    Spacer().frame(height: 20)

                    // Week badge
                    Text("Week \(questions[currentIndex].weekNumber)")
                        .font(.caption.weight(.semibold))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Capsule().fill(Color.blue.opacity(0.15)))
                        .foregroundColor(.blue)

                    // Statement card
                    Text(questions[currentIndex].statement)
                        .font(.title3.weight(.medium))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(.systemBackground))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(flashColor, lineWidth: 3)
                                )
                        )
                        .shadow(color: .black.opacity(0.06), radius: 6, y: 2)
                        .padding(.horizontal)

                    // Answer field
                    VStack(spacing: 12) {
                        TextField("Type your answer...", text: $userAnswer)
                            .textFieldStyle(.roundedBorder)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .disabled(answered)
                            .focused($isTextFieldFocused)
                            .onSubmit { if !answered { submitAnswer() } }
                            .padding(.horizontal)

                        if answered {
                            VStack(spacing: 8) {
                                if isCorrect {
                                    Label("Correct!", systemImage: "checkmark.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(.green)
                                } else {
                                    Label("Incorrect", systemImage: "xmark.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(.red)
                                    Text("Answer: \(questions[currentIndex].answer)")
                                        .font(.body.weight(.semibold))
                                        .foregroundColor(.blue)
                                }
                            }
                            .transition(.scale.combined(with: .opacity))
                        }
                    }

                    // Submit / Next button
                    if !answered {
                        Button {
                            submitAnswer()
                        } label: {
                            Text("Submit")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(userAnswer.trimmingCharacters(in: .whitespaces).isEmpty ? Color.gray : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(14)
                        }
                        .disabled(userAnswer.trimmingCharacters(in: .whitespaces).isEmpty)
                        .padding(.horizontal)
                    } else {
                        Button {
                            nextQuestion()
                        } label: {
                            Text(currentIndex + 1 < questions.count ? "Next Question" : "See Results")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(14)
                        }
                        .padding(.horizontal)
                    }

                    Spacer().frame(height: 40)
                }
            }
        }
    }

    // MARK: - Completion View

    private var completionView: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: score >= questions.count / 2 ? "star.circle.fill" : "arrow.counterclockwise.circle.fill")
                .font(.system(size: 72))
                .foregroundStyle(score >= questions.count / 2 ? .yellow : .orange)

            Text("Round Complete!")
                .font(.largeTitle.weight(.bold))

            VStack(spacing: 16) {
                HStack(spacing: 32) {
                    statBubble(icon: "checkmark.circle.fill", value: "\(score)", label: "Correct", color: .green)
                    statBubble(icon: "xmark.circle.fill", value: "\(questions.count - score)", label: "Incorrect", color: .red)
                }

                let pct = questions.count > 0 ? Double(score) / Double(questions.count) * 100 : 0
                Text("\(Int(pct))% Accuracy")
                    .font(.headline)
                    .foregroundColor(pct >= 80 ? .green : pct >= 60 ? .orange : .red)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemBackground)))
            .shadow(color: .black.opacity(0.08), radius: 8, y: 2)
            .padding(.horizontal)

            // Missed questions review
            let missed = results.filter { !$0.correct }
            if !missed.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Review Missed Questions")
                        .font(.headline)
                        .padding(.horizontal)

                    ForEach(missed.indices, id: \.self) { i in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(missed[i].question.statement)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            HStack {
                                Text("Your answer: \(missed[i].userAnswer)")
                                    .font(.caption.weight(.medium))
                                    .foregroundColor(.red)
                                Spacer()
                                Text("Correct: \(missed[i].question.answer)")
                                    .font(.caption.weight(.medium))
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: 200)
            }

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
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
            Text(value)
                .font(.title3.weight(.bold))
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }

    // MARK: - Logic

    private func setupGame() {
        var pool: [FillInBlankQuestion]
        if let week = weekFilter {
            pool = FillInBlankData.allQuestions.filter { $0.weekNumber == week }
        } else {
            pool = FillInBlankData.allQuestions
        }
        questions = Array(pool.shuffled().prefix(questionsPerRound))
        currentIndex = 0
        score = 0
        answered = false
        isCorrect = false
        isComplete = false
        userAnswer = ""
        results = []
        flashColor = .clear
        isTextFieldFocused = true
    }

    private func resetGame() {
        withAnimation { isComplete = false }
        setupGame()
    }

    private func submitAnswer() {
        let question = questions[currentIndex]
        isCorrect = question.isCorrect(userAnswer)
        if isCorrect { score += 1 }

        results.append((question: question, userAnswer: userAnswer, correct: isCorrect))

        withAnimation(.easeInOut(duration: 0.2)) {
            answered = true
            flashColor = isCorrect ? .green : .red
        }

        let generator = UIImpactFeedbackGenerator(style: isCorrect ? .medium : .heavy)
        generator.impactOccurred()

        // Clear flash after a moment
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation { flashColor = .clear }
        }
    }

    private func nextQuestion() {
        if currentIndex + 1 < questions.count {
            withAnimation(.easeInOut(duration: 0.2)) {
                currentIndex += 1
                answered = false
                isCorrect = false
                userAnswer = ""
                flashColor = .clear
            }
            isTextFieldFocused = true
        } else {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                isComplete = true
            }
        }
    }
}
