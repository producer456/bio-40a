import SwiftUI

struct DiagramsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Anatomical Orientation")) {
                    NavigationLink(destination: BodyPlanesView()) {
                        DiagramRow(
                            icon: "rectangle.split.3x1",
                            color: .purple,
                            title: "Body Planes",
                            subtitle: "Sagittal, Frontal, Transverse"
                        )
                    }

                    NavigationLink(destination: BodyCavitiesView()) {
                        DiagramRow(
                            icon: "person.fill",
                            color: .teal,
                            title: "Body Cavities",
                            subtitle: "Dorsal, Ventral, Thoracic, Abdominopelvic"
                        )
                    }
                }

                Section(header: Text("Homeostasis")) {
                    NavigationLink(destination: FeedbackLoopView(isPositive: false)) {
                        DiagramRow(
                            icon: "arrow.triangle.2.circlepath",
                            color: .blue,
                            title: "Negative Feedback Loop",
                            subtitle: "Thermoregulation example"
                        )
                    }

                    NavigationLink(destination: FeedbackLoopView(isPositive: true)) {
                        DiagramRow(
                            icon: "arrow.triangle.2.circlepath.circle.fill",
                            color: .orange,
                            title: "Positive Feedback Loop",
                            subtitle: "Childbirth example"
                        )
                    }
                }

                Section(header: Text("Organization")) {
                    NavigationLink(destination: LevelsOfOrgView()) {
                        DiagramRow(
                            icon: "chart.bar.fill",
                            color: .green,
                            title: "Levels of Organization",
                            subtitle: "Atom to Organism"
                        )
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Diagrams")
        }
    }
}

struct DiagramRow: View {
    let icon: String
    let color: Color
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(color.gradient)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    DiagramsView()
}
