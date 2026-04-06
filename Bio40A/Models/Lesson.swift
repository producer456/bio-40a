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
        case 5: return "Mon, Apr 20"
        case 6: return "Wed, Apr 22"
        case 7: return "Wed, Apr 29"
        case 8: return "Mon, May 4"
        case 9: return "Wed, May 6"
        case 10: return "Mon, May 11"
        case 11: return "Wed, May 13"
        case 12: return "Mon, May 18"
        case 13: return "Wed, May 27"
        case 14: return "Mon, Jun 1"
        case 15: return "Wed, Jun 3"
        case 16: return "Mon, Jun 8"
        case 17: return "Wed, Jun 10"
        case 18: return "Mon, Jun 15"
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
