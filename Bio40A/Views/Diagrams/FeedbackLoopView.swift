import SwiftUI

struct FeedbackLoopView: View {
    @State var isPositive: Bool
    @State private var animationProgress: CGFloat = 0
    @State private var isAnimating = false

    private var components: [(String, String, String)] {
        if isPositive {
            return [
                ("Stimulus", "Cervix stretches", "exclamationmark.triangle.fill"),
                ("Sensor", "Stretch receptors", "sensor.fill"),
                ("Control Center", "Brain (hypothalamus)", "brain.head.profile"),
                ("Effector", "Pituitary releases oxytocin", "arrow.up.right.circle.fill"),
                ("Response", "Stronger contractions\n(amplifies stimulus)", "arrow.up.forward"),
            ]
        } else {
            return [
                ("Stimulus", "Body temp rises", "thermometer.high"),
                ("Sensor", "Thermoreceptors", "sensor.fill"),
                ("Control Center", "Hypothalamus", "brain.head.profile"),
                ("Effector", "Sweat glands activate", "drop.fill"),
                ("Response", "Body temp decreases\n(opposes stimulus)", "arrow.down.forward"),
            ]
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Toggle
                Picker("Feedback Type", selection: $isPositive) {
                    Text("Negative").tag(false)
                    Text("Positive").tag(true)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .onChange(of: isPositive) { oldValue, newValue in
                    animationProgress = 0
                    isAnimating = false
                }

                Text(isPositive ? "Positive Feedback: Response amplifies the stimulus"
                     : "Negative Feedback: Response opposes the stimulus")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Example
                HStack(spacing: 6) {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                    Text(isPositive ? "Example: Childbirth contractions"
                         : "Example: Thermoregulation")
                        .font(.subheadline).bold()
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray6))
                )

                // Circular loop diagram
                ZStack {
                    // Draw connecting arrows
                    FeedbackArrows(count: components.count, isPositive: isPositive)
                        .stroke(
                            isPositive ? Color.orange.opacity(0.4) : Color.blue.opacity(0.4),
                            style: StrokeStyle(lineWidth: 3, lineCap: .round)
                        )

                    // Animated dot
                    if isAnimating {
                        PulsingDot(
                            progress: animationProgress,
                            count: components.count,
                            color: isPositive ? .orange : .blue
                        )
                    }

                    // Component nodes
                    GeometryReader { geo in
                        let size = geo.size
                        let center = CGPoint(x: size.width / 2, y: size.height / 2)
                        let radius = min(size.width, size.height) * 0.35

                        ForEach(Array(components.enumerated()), id: \.offset) { index, comp in
                            let angle = angleFor(index: index, total: components.count)
                            let x = center.x + radius * cos(angle)
                            let y = center.y + radius * sin(angle)

                            FeedbackNode(
                                title: comp.0,
                                detail: comp.1,
                                icon: comp.2,
                                color: isPositive ? .orange : .blue,
                                isHighlighted: isAnimating && isNodeHighlighted(index: index)
                            )
                            .position(x: x, y: y)
                        }

                        // Center label
                        VStack(spacing: 4) {
                            Image(systemName: isPositive
                                  ? "plus.circle.fill" : "minus.circle.fill")
                                .font(.title)
                                .foregroundColor(isPositive ? .orange : .blue)
                            Text(isPositive ? "POSITIVE" : "NEGATIVE")
                                .font(.caption2).bold()
                                .foregroundColor(isPositive ? .orange : .blue)
                            Text("Feedback")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        .position(x: center.x, y: center.y)
                    }
                }
                .frame(height: 380)
                .padding(.horizontal, 8)

                // Animate button
                Button {
                    startAnimation()
                } label: {
                    HStack {
                        Image(systemName: isAnimating ? "stop.fill" : "play.fill")
                        Text(isAnimating ? "Stop Animation" : "Animate Loop")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(isPositive ? Color.orange : Color.blue)
                    )
                }

                // Key difference callout
                VStack(alignment: .leading, spacing: 8) {
                    Text("Key Difference")
                        .font(.headline)
                    if isPositive {
                        Text("In positive feedback, the response reinforces the original stimulus, pushing the variable further from the set point. This continues until an external event breaks the loop (e.g., delivery of the baby).")
                            .font(.subheadline)
                    } else {
                        Text("In negative feedback, the response counteracts the original stimulus, bringing the variable back toward the set point. This maintains homeostasis.")
                            .font(.subheadline)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                )
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
            .padding(.top)
        }
        .navigationTitle(isPositive ? "Positive Feedback" : "Negative Feedback")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func angleFor(index: Int, total: Int) -> CGFloat {
        let start = -CGFloat.pi / 2 // start at top
        return start + (2 * .pi / CGFloat(total)) * CGFloat(index)
    }

    private func isNodeHighlighted(index: Int) -> Bool {
        let segment = 1.0 / CGFloat(components.count)
        let nodeProgress = CGFloat(index) * segment
        let tolerance = segment * 0.5
        return abs(animationProgress - nodeProgress) < tolerance ||
               abs(animationProgress - nodeProgress - 1.0) < tolerance
    }

    private func startAnimation() {
        if isAnimating {
            isAnimating = false
            animationProgress = 0
            return
        }
        isAnimating = true
        animationProgress = 0
        withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
            animationProgress = 1.0
        }
    }
}

struct FeedbackNode: View {
    let title: String
    let detail: String
    let icon: String
    let color: Color
    let isHighlighted: Bool

    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(color)

            Text(title)
                .font(.caption).bold()
                .foregroundColor(.primary)

            Text(detail)
                .font(.system(size: 9))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: 100, height: 70)
        .padding(6)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
                .shadow(color: isHighlighted ? color.opacity(0.5) : .clear, radius: 6)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(color.opacity(isHighlighted ? 0.8 : 0.3), lineWidth: isHighlighted ? 2 : 1)
        )
        .scaleEffect(isHighlighted ? 1.08 : 1.0)
        .animation(.easeInOut(duration: 0.3), value: isHighlighted)
    }
}

struct FeedbackArrows: Shape {
    let count: Int
    let isPositive: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) * 0.35
        let start = -CGFloat.pi / 2

        for i in 0..<count {
            let a1 = start + (2 * .pi / CGFloat(count)) * CGFloat(i)
            let a2 = start + (2 * .pi / CGFloat(count)) * CGFloat(i + 1)
            let p1 = CGPoint(x: center.x + radius * cos(a1), y: center.y + radius * sin(a1))
            let p2 = CGPoint(x: center.x + radius * cos(a2), y: center.y + radius * sin(a2))
            path.move(to: p1)
            path.addLine(to: p2)

            // Arrowhead
            let angle = atan2(p2.y - p1.y, p2.x - p1.x)
            let arrowLen: CGFloat = 8
            path.move(to: p2)
            path.addLine(to: CGPoint(
                x: p2.x - arrowLen * cos(angle - .pi / 6),
                y: p2.y - arrowLen * sin(angle - .pi / 6)
            ))
            path.move(to: p2)
            path.addLine(to: CGPoint(
                x: p2.x - arrowLen * cos(angle + .pi / 6),
                y: p2.y - arrowLen * sin(angle + .pi / 6)
            ))
        }

        return path
    }
}

struct PulsingDot: View {
    let progress: CGFloat
    let count: Int
    let color: Color

    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            let center = CGPoint(x: size.width / 2, y: size.height / 2)
            let radius = min(size.width, size.height) * 0.35
            let start = -CGFloat.pi / 2
            let angle = start + 2 * .pi * progress

            Circle()
                .fill(color)
                .frame(width: 12, height: 12)
                .shadow(color: color, radius: 4)
                .position(
                    x: center.x + radius * cos(angle),
                    y: center.y + radius * sin(angle)
                )
        }
    }
}

#Preview {
    NavigationView {
        FeedbackLoopView(isPositive: false)
    }
}
