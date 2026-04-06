import SwiftUI

struct ImageQuizView: View {
    @Environment(\.dismiss) private var dismiss

    let quizSet: ImageQuizSet

    @State private var currentIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var hasAnswered = false
    @State private var correctCount = 0
    @State private var answers: [Int] = []
    @State private var isFinished = false
    @State private var showReviewWrong = false
    @State private var startTime = Date()
    @State private var finishedTime: TimeInterval = 0

    private var currentQuestion: ImageQuestion {
        quizSet.questions[currentIndex]
    }

    private var progressFraction: Double {
        guard quizSet.questionCount > 0 else { return 0 }
        return Double(currentIndex) / Double(quizSet.questionCount)
    }

    var body: some View {
        VStack(spacing: 0) {
            if isFinished {
                scoreView
            } else {
                questionView
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(quizSet.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(isFinished)
        .toolbar {
            if isFinished {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }

    // MARK: - Question View

    private var questionView: some View {
        VStack(spacing: 0) {
            progressBar

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Question counter
                    Text("Question \(currentIndex + 1) of \(quizSet.questionCount)")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)

                    // Diagram
                    HStack {
                        Spacer()
                        DiagramRouter(
                            diagramType: currentQuestion.diagramType,
                            highlightLabel: currentQuestion.highlightLabel
                        )
                        Spacer()
                    }

                    // Question text
                    Text(currentQuestion.question)
                        .font(.body)
                        .fontWeight(.medium)
                        .lineSpacing(4)

                    // Answer choices
                    VStack(spacing: 10) {
                        ForEach(Array(currentQuestion.choices.enumerated()), id: \.offset) { index, choice in
                            answerButton(index: index, text: choice)
                        }
                    }

                    // Explanation
                    if hasAnswered {
                        explanationView
                    }

                    // Next button
                    if hasAnswered {
                        nextButton
                    }
                }
                .padding()
            }
        }
    }

    private var progressBar: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.blue.opacity(0.15))
                    .frame(height: 4)

                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geo.size.width * progressFraction, height: 4)
                    .animation(.easeInOut, value: currentIndex)
            }
        }
        .frame(height: 4)
    }

    private func answerButton(index: Int, text: String) -> some View {
        let letters = ["A", "B", "C", "D"]
        let isSelected = selectedAnswer == index
        let isCorrect = index == currentQuestion.correctIndex

        return Button {
            guard !hasAnswered else { return }
            selectedAnswer = index
            hasAnswered = true
            answers.append(index)
            if isCorrect { correctCount += 1 }
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(circleColor(isSelected: isSelected, isCorrect: isCorrect))
                        .frame(width: 34, height: 34)

                    if hasAnswered && isCorrect {
                        Image(systemName: "checkmark")
                            .font(.caption).fontWeight(.bold).foregroundColor(.white)
                    } else if hasAnswered && isSelected && !isCorrect {
                        Image(systemName: "xmark")
                            .font(.caption).fontWeight(.bold).foregroundColor(.white)
                    } else {
                        Text(index < letters.count ? letters[index] : "")
                            .font(.subheadline).fontWeight(.semibold)
                            .foregroundColor(hasAnswered ? .secondary : .blue)
                    }
                }

                Text(text)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(2)

                Spacer()
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(bgColor(isSelected: isSelected, isCorrect: isCorrect))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor(isSelected: isSelected, isCorrect: isCorrect),
                                    lineWidth: isSelected || (hasAnswered && isCorrect) ? 2 : 1)
                    )
            )
        }
        .disabled(hasAnswered)
    }

    private func circleColor(isSelected: Bool, isCorrect: Bool) -> Color {
        guard hasAnswered else { return Color.blue.opacity(0.1) }
        if isCorrect { return .green }
        if isSelected { return .red }
        return Color.gray.opacity(0.1)
    }

    private func bgColor(isSelected: Bool, isCorrect: Bool) -> Color {
        guard hasAnswered else { return Color(.systemBackground) }
        if isCorrect { return Color.green.opacity(0.08) }
        if isSelected { return Color.red.opacity(0.08) }
        return Color(.systemBackground)
    }

    private func borderColor(isSelected: Bool, isCorrect: Bool) -> Color {
        guard hasAnswered else { return Color.gray.opacity(0.2) }
        if isCorrect { return .green }
        if isSelected { return .red }
        return Color.gray.opacity(0.15)
    }

    private var explanationView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Explanation", systemImage: "lightbulb.fill")
                .font(.subheadline).fontWeight(.semibold).foregroundColor(.blue)

            Text(currentQuestion.explanation)
                .font(.subheadline)
                .lineSpacing(3)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.06))
        )
        .transition(.opacity.combined(with: .move(edge: .bottom)))
    }

    private var nextButton: some View {
        Button {
            if currentIndex < quizSet.questionCount - 1 {
                withAnimation {
                    currentIndex += 1
                    selectedAnswer = nil
                    hasAnswered = false
                }
            } else {
                finishQuiz()
            }
        } label: {
            HStack {
                Text(currentIndex < quizSet.questionCount - 1 ? "Next Question" : "Finish Quiz")
                    .fontWeight(.semibold)
                Image(systemName: currentIndex < quizSet.questionCount - 1 ? "arrow.right" : "checkmark.circle")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.blue))
            .foregroundColor(.white)
        }
        .padding(.top, 8)
    }

    // MARK: - Score View

    private var scoreView: some View {
        ScrollView {
            VStack(spacing: 24) {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.15), lineWidth: 12)
                        .frame(width: 160, height: 160)

                    Circle()
                        .trim(from: 0, to: CGFloat(correctCount) / CGFloat(quizSet.questionCount))
                        .stroke(scoreColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 160, height: 160)
                        .rotationEffect(.degrees(-90))

                    VStack(spacing: 4) {
                        Text(String(format: "%.0f%%", scorePercentage))
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(scoreColor)
                        Text("\(correctCount)/\(quizSet.questionCount)")
                            .font(.subheadline).foregroundColor(.secondary)
                    }
                }
                .padding(.top, 20)

                Text(scoreMessage)
                    .font(.title3).fontWeight(.semibold).multilineTextAlignment(.center)

                // Stats row
                HStack(spacing: 20) {
                    statItem(icon: "clock.fill", color: .blue, value: timeFormatted, label: "Time")
                    Divider().frame(height: 40)
                    statItem(icon: "checkmark.circle.fill", color: .green, value: "\(correctCount)", label: "Correct")
                    Divider().frame(height: 40)
                    statItem(icon: "xmark.circle.fill", color: .red, value: "\(quizSet.questionCount - correctCount)", label: "Wrong")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
                )

                // Review wrong answers
                if correctCount < quizSet.questionCount {
                    Button {
                        showReviewWrong.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                            Text(showReviewWrong ? "Hide Review" : "Review Wrong Answers")
                                .fontWeight(.medium)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 14).stroke(Color.blue, lineWidth: 2))
                        .foregroundColor(.blue)
                    }

                    if showReviewWrong {
                        wrongAnswersReview
                    }
                }

                // Retake
                Button {
                    resetQuiz()
                } label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Retake Quiz").fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color.blue))
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }

    private func statItem(icon: String, color: Color, value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon).foregroundColor(color)
            Text(value).font(.subheadline).fontWeight(.medium)
            Text(label).font(.caption2).foregroundColor(.secondary)
        }
    }

    private var wrongAnswersReview: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(Array(quizSet.questions.enumerated()), id: \.offset) { index, question in
                if index < answers.count && answers[index] != question.correctIndex {
                    VStack(alignment: .leading, spacing: 8) {
                        // Mini diagram
                        HStack {
                            DiagramRouter(diagramType: question.diagramType, highlightLabel: question.highlightLabel)
                                .scaleEffect(0.5)
                                .frame(width: 100, height: 100)
                            Spacer()
                        }

                        Text("Q\(index + 1): \(question.question)")
                            .font(.subheadline).fontWeight(.medium)

                        HStack(spacing: 6) {
                            Image(systemName: "xmark.circle.fill").foregroundColor(.red).font(.caption)
                            Text("Your answer: \(question.choices[answers[index]])")
                                .font(.caption).foregroundColor(.red)
                        }

                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green).font(.caption)
                            Text("Correct: \(question.choices[question.correctIndex])")
                                .font(.caption).foregroundColor(.green)
                        }

                        Text(question.explanation)
                            .font(.caption).foregroundColor(.secondary).lineSpacing(2)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
                }
            }
        }
        .transition(.opacity)
    }

    // MARK: - Helpers

    private var scorePercentage: Double {
        guard quizSet.questionCount > 0 else { return 0 }
        return Double(correctCount) / Double(quizSet.questionCount) * 100
    }

    private var scoreColor: Color {
        if scorePercentage >= 90 { return .green }
        if scorePercentage >= 70 { return .blue }
        if scorePercentage >= 50 { return .orange }
        return .red
    }

    private var scoreMessage: String {
        if scorePercentage >= 90 { return "Excellent Work!" }
        if scorePercentage >= 70 { return "Good Job!" }
        if scorePercentage >= 50 { return "Keep Practicing!" }
        return "Review the Material"
    }

    private var timeFormatted: String {
        let elapsed = isFinished ? finishedTime : Date().timeIntervalSince(startTime)
        let minutes = Int(elapsed) / 60
        let seconds = Int(elapsed) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

    private func finishQuiz() {
        finishedTime = Date().timeIntervalSince(startTime)
        withAnimation { isFinished = true }
    }

    private func resetQuiz() {
        currentIndex = 0
        selectedAnswer = nil
        hasAnswered = false
        correctCount = 0
        answers = []
        isFinished = false
        showReviewWrong = false
        startTime = Date()
        finishedTime = 0
    }
}

#Preview {
    NavigationStack {
        ImageQuizView(quizSet: ImageQuizData.quizSets[0])
    }
}
