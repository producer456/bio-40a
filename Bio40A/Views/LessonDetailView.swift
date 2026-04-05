import SwiftUI

struct LessonDetailView: View {
    @EnvironmentObject var progress: ProgressManager

    let lesson: Lesson

    @State private var readingStartTime = Date()
    @State private var showCompletionAlert = false

    private var isComplete: Bool {
        progress.isLessonComplete(lesson.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                headerSection
                sectionsContent
                if let clinical = lesson.clinicalApplication {
                    clinicalApplicationCard(clinical)
                }
                markCompleteButton
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(lesson.title)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            trackReadingTime()
        }
        .alert("Lesson Complete!", isPresented: $showCompletionAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Great work! This lesson has been marked as complete.")
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(lesson.title)
                .font(.title2)
                .fontWeight(.bold)

            Text(lesson.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack(spacing: 16) {
                Label(lesson.dateString, systemImage: "calendar")
                    .font(.caption)
                    .foregroundColor(.secondary)

                if !lesson.textbookChapter.isEmpty {
                    Label(lesson.textbookChapter, systemImage: "book")
                        .font(.caption)
                        .foregroundColor(.blue)
                }

                if !lesson.textbookSections.isEmpty {
                    Label(lesson.textbookSections, systemImage: "list.number")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            if isComplete {
                HStack(spacing: 4) {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                    Text("Completed")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.green)
                }
                .padding(.top, 4)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - Sections

    private var sectionsContent: some View {
        ForEach(lesson.sections) { section in
            VStack(alignment: .leading, spacing: 14) {
                // Section heading
                Text(section.heading)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)

                // Content text
                Text(section.content)
                    .font(.body)
                    .lineSpacing(4)

                // Key terms
                if !section.keyTerms.isEmpty {
                    keyTermsView(section.keyTerms)
                }

                // Testable facts
                if !section.testablesFacts.isEmpty {
                    testablesFactsView(section.testablesFacts)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
            )
        }
    }

    // MARK: - Key Terms

    private func keyTermsView(_ terms: [KeyTerm]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Key Terms", systemImage: "textformat.abc")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)

            ForEach(terms) { term in
                HStack(alignment: .top, spacing: 8) {
                    Text(term.term)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.blue.opacity(0.1))
                        )

                    Text(term.definition)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue.opacity(0.04))
        )
    }

    // MARK: - Testable Facts

    private func testablesFactsView(_ facts: [String]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Must-Know Facts", systemImage: "exclamationmark.triangle.fill")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.orange)

            ForEach(facts, id: \.self) { fact in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "star.fill")
                        .font(.caption2)
                        .foregroundColor(.orange)
                        .padding(.top, 4)

                    Text(fact)
                        .font(.subheadline)
                        .lineSpacing(2)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                )
        )
    }

    // MARK: - Clinical Application

    private func clinicalApplicationCard(_ clinical: ClinicalApplication) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "cross.case.fill")
                    .foregroundColor(.red)
                Text("Clinical Application")
                    .font(.headline)
                    .foregroundColor(.red)
            }

            Text(clinical.title)
                .font(.subheadline)
                .fontWeight(.bold)

            Text(clinical.scenario)
                .font(.subheadline)
                .lineSpacing(3)

            Divider()

            VStack(alignment: .leading, spacing: 4) {
                Text("Connection to EMT Practice")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.red.opacity(0.8))

                Text(clinical.connection)
                    .font(.subheadline)
                    .lineSpacing(3)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.red.opacity(0.3), lineWidth: 2)
                )
                .shadow(color: .black.opacity(0.05), radius: 8, y: 2)
        )
    }

    // MARK: - Mark Complete Button

    private var markCompleteButton: some View {
        Button {
            if !isComplete {
                progress.markLessonComplete(lesson.id, weekNumber: lesson.weekNumber)
                trackReadingTime()
                showCompletionAlert = true
            }
        } label: {
            HStack(spacing: 8) {
                Image(systemName: isComplete ? "checkmark.seal.fill" : "checkmark.circle")
                Text(isComplete ? "Completed" : "Mark as Complete")
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isComplete ? Color.green : Color.blue)
            )
            .foregroundColor(.white)
        }
        .disabled(isComplete)
        .padding(.vertical, 8)
    }

    // MARK: - Helpers

    private func trackReadingTime() {
        let elapsed = Date().timeIntervalSince(readingStartTime)
        if elapsed > 5 { // only track if > 5 seconds
            progress.addStudyTime(elapsed, weekNumber: lesson.weekNumber)
        }
        readingStartTime = Date()
    }
}

#Preview {
    NavigationStack {
        LessonDetailView(lesson: Lesson(
            id: "preview",
            weekNumber: 1,
            classNumber: 1,
            title: "Introduction to Anatomy",
            subtitle: "Basic anatomical terminology and body organization",
            textbookChapter: "Chapter 1",
            textbookSections: "1.1 - 1.4",
            sections: [
                LessonSection(
                    id: "s1",
                    heading: "Anatomical Position",
                    content: "The anatomical position is the standard reference point for describing body structures and their locations. In anatomical position, the body is erect, facing forward, with arms at the sides and palms facing forward.",
                    keyTerms: [
                        KeyTerm(id: "kt1", term: "Anatomical Position", definition: "Standard body position used as reference")
                    ],
                    testablesFacts: [
                        "In anatomical position, palms face anteriorly",
                        "All directional terms reference anatomical position"
                    ]
                )
            ],
            clinicalApplication: ClinicalApplication(
                title: "Patient Assessment",
                scenario: "An EMT arrives on scene to find a patient lying supine. Using anatomical terminology, the EMT can accurately describe injury locations.",
                connection: "Accurate anatomical terminology ensures clear communication between healthcare providers during patient handoff."
            )
        ))
    }
    .environmentObject(ProgressManager())
}
