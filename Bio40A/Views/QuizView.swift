import SwiftUI

struct QuizView: View {
    @EnvironmentObject var progress: ProgressManager
    @Environment(\.dismiss) private var dismiss

    let quiz: Quiz

    @State private var currentIndex = 0
    @State private var selectedAnswer: Int? = nil
    @State private var hasAnswered = false
    @State private var correctCount = 0
    @State private var answers: [Int] = []
    @State private var isFinished = false
    @State private var showReviewWrong = false
    @State private var startTime = Date()

    private var currentQuestion: QuizQuestion {
        quiz.questions[currentIndex]
    }

    private var progressFraction: Double {
        guard quiz.questionCount > 0 else { return 0 }
        return Double(currentIndex) / Double(quiz.questionCount)
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
        .navigationTitle(quiz.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(isFinished)
        .toolbar {
            if isFinished {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }

    // MARK: - Question View

    private var questionView: some View {
        VStack(spacing: 0) {
            // Progress bar
            progressBar

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Question counter
                    Text("Question \(currentIndex + 1) of \(quiz.questionCount)")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)

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

                    // Explanation (shown after answering)
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
            if isCorrect {
                correctCount += 1
            }
        } label: {
            HStack(spacing: 12) {
                // Letter circle
                ZStack {
                    Circle()
                        .fill(buttonCircleColor(isSelected: isSelected, isCorrect: isCorrect))
                        .frame(width: 34, height: 34)

                    if hasAnswered && isCorrect {
                        Image(systemName: "checkmark")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    } else if hasAnswered && isSelected && !isCorrect {
                        Image(systemName: "xmark")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    } else {
                        Text(index < letters.count ? letters[index] : "")
                            .font(.subheadline)
                            .fontWeight(.semibold)
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
                    .fill(buttonBackgroundColor(isSelected: isSelected, isCorrect: isCorrect))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(buttonBorderColor(isSelected: isSelected, isCorrect: isCorrect), lineWidth: isSelected || (hasAnswered && isCorrect) ? 2 : 1)
                    )
            )
        }
        .disabled(hasAnswered)
    }

    private func buttonCircleColor(isSelected: Bool, isCorrect: Bool) -> Color {
        guard hasAnswered else {
            return Color.blue.opacity(0.1)
        }
        if isCorrect { return .green }
        if isSelected { return .red }
        return Color.gray.opacity(0.1)
    }

    private func buttonBackgroundColor(isSelected: Bool, isCorrect: Bool) -> Color {
        guard hasAnswered else {
            return Color(.systemBackground)
        }
        if isCorrect { return Color.green.opacity(0.08) }
        if isSelected { return Color.red.opacity(0.08) }
        return Color(.systemBackground)
    }

    private func buttonBorderColor(isSelected: Bool, isCorrect: Bool) -> Color {
        guard hasAnswered else {
            return Color.gray.opacity(0.2)
        }
        if isCorrect { return .green }
        if isSelected { return .red }
        return Color.gray.opacity(0.15)
    }

    private var explanationView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Explanation", systemImage: "lightbulb.fill")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)

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
            if currentIndex < quiz.questionCount - 1 {
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
                Text(currentIndex < quiz.questionCount - 1 ? "Next Question" : "Finish Quiz")
                    .fontWeight(.semibold)
                Image(systemName: currentIndex < quiz.questionCount - 1 ? "arrow.right" : "checkmark.circle")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.blue)
            )
            .foregroundColor(.white)
        }
        .padding(.top, 8)
    }

    // MARK: - Score View

    private var scoreView: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Score circle
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.15), lineWidth: 12)
                        .frame(width: 160, height: 160)

                    Circle()
                        .trim(from: 0, to: CGFloat(correctCount) / CGFloat(quiz.questionCount))
                        .stroke(scoreColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 160, height: 160)
                        .rotationEffect(.degrees(-90))

                    VStack(spacing: 4) {
                        Text(String(format: "%.0f%%", scorePercentage))
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(scoreColor)

                        Text("\(correctCount)/\(quiz.questionCount)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 20)

                // Message
                Text(scoreMessage)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)

                // Stats row
                HStack(spacing: 20) {
                    VStack(spacing: 4) {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.blue)
                        Text(timeSpentFormatted)
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Text("Time")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }

                    Divider()
                        .frame(height: 40)

                    VStack(spacing: 4) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("\(correctCount)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Text("Correct")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }

                    Divider()
                        .frame(height: 40)

                    VStack(spacing: 4) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                        Text("\(quiz.questionCount - correctCount)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Text("Wrong")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(.systemBackground))
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
                )

                // Review wrong answers
                if correctCount < quiz.questionCount {
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
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                        .foregroundColor(.blue)
                    }

                    if showReviewWrong {
                        wrongAnswersReview
                    }
                }

                // Retake button
                Button {
                    resetQuiz()
                } label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Retake Quiz")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.blue)
                    )
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
    }

    private var wrongAnswersReview: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(Array(quiz.questions.enumerated()), id: \.offset) { index, question in
                if index < answers.count && answers[index] != question.correctIndex {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Q\(index + 1): \(question.question)")
                            .font(.subheadline)
                            .fontWeight(.medium)

                        HStack(spacing: 6) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .font(.caption)
                            Text("Your answer: \(question.choices[answers[index]])")
                                .font(.caption)
                                .foregroundColor(.red)
                        }

                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.caption)
                            Text("Correct: \(question.choices[question.correctIndex])")
                                .font(.caption)
                                .foregroundColor(.green)
                        }

                        Text(question.explanation)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineSpacing(2)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemBackground))
                    )
                }
            }
        }
        .transition(.opacity)
    }

    // MARK: - Helpers

    private var scorePercentage: Double {
        guard quiz.questionCount > 0 else { return 0 }
        return Double(correctCount) / Double(quiz.questionCount) * 100
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

    private var timeSpentFormatted: String {
        let elapsed = Date().timeIntervalSince(startTime)
        let minutes = Int(elapsed) / 60
        let seconds = Int(elapsed) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

    private func finishQuiz() {
        let elapsed = Date().timeIntervalSince(startTime)
        let attempt = QuizAttempt(
            id: UUID().uuidString,
            quizId: quiz.id,
            date: Date(),
            answers: answers,
            score: correctCount,
            totalQuestions: quiz.questionCount,
            timeSpent: elapsed
        )
        progress.recordQuizAttempt(attempt, weekNumber: quiz.weekNumber)
        withAnimation {
            isFinished = true
        }
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
    }
}

#Preview {
    NavigationStack {
        QuizView(quiz: Quiz(
            id: "preview",
            title: "Week 1 Quiz",
            weekNumber: 1,
            lessonIds: ["l1"],
            questions: [
                QuizQuestion(
                    id: "q1",
                    question: "What is the anatomical term for 'toward the front'?",
                    choices: ["Posterior", "Anterior", "Superior", "Inferior"],
                    correctIndex: 1,
                    explanation: "Anterior (ventral) means toward the front of the body.",
                    difficulty: .easy,
                    category: .recall
                )
            ],
            timeLimit: nil
        ))
    }
    .environmentObject(ProgressManager())
}
