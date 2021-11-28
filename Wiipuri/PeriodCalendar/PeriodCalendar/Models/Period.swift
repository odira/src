import Foundation

struct Period: Identifiable {
    var id: UUID = UUID()
    
    var personId: Int?
    var personSurname: String?
    var personName: String?
    var personMiddleName: String?
    var personTabNum: Int?
    var personPosition: String?
    var personShiftNum: Int?
    var personSectorsPool: String?
    
    var activityId: Int?
    var activityAbbr: String?
    var activityActivity: String?
    var activityColor: String?
    var activityNote: String?
    
    var valid: Bool
    
//    var period: DateInterval
//    var start: Date
//    var end: Date
//    var duration: DateInterval
    
    var note: String?
}
