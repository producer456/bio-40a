import Foundation

struct Lesson: Identifiable, Codable {
    let id: String
    let weekNumber: Int
    let classNumber: Int  // 1-4 for weeks 1-2
    let title: String
    let subtitle: String
    let textbookChapter: String
    let textbookSections: String
    let sections: [LessonSection]
    let clinicalApplication: ClinicalApplication?

    var dateString: String {
        switch classNumber {
        case 1: return "Mon, Apr 6"
        case 2: return "Wed, Apr 8"
        case 3: return "Mon, Apr 13"
        case 4: return "Wed, Apr 15"
        default: return ""
        }
    }
}

struct LessonSection: Identifiable, Codable {
    let id: String
    let heading: String
    let content: String
    let keyTerms: [KeyTerm]
    let testablesFacts: [String]  // highlighted "must know" facts
}

struct KeyTerm: Identifiable, Codable {
    let id: String
    let term: String
    let definition: String
}

struct ClinicalApplication: Codable {
    let title: String
    let scenario: String
    let connection: String  // how it connects to EMT/clinical work
}
