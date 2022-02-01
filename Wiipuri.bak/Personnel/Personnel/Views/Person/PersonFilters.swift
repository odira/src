import Foundation

enum PersonValid {
    case all
    case valid
    case invalid
}

class PersonFilters: ObservableObject {
    @Published var byValid: PersonValid = .all
    @Published var byName: String = ""
    @Published var byMiddlename: String = ""
    @Published var bySurname: String = ""
    @Published var byShiftNum: Int = 0
    
    init() {
        byValid = .all
        byName = ""
        byMiddlename = ""
        bySurname = ""
        byShiftNum = 0
    }
    
    func update() {
        byValid = .all
        byName = ""
        byMiddlename = ""
        bySurname = ""
        byShiftNum = 0
    }
}
