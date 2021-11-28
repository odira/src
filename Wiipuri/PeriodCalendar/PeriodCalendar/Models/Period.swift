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
    
    var valid: Bool?
    
//    var period: DateInterval
    var startDate: Date?
    var endDate: Date?
//    var duration: DateInterval
    
    var note: String?
}

extension Period {
    var startDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        return formatter.string(from: startDate!)
    }
}

extension Period {
    var endDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        return formatter.string(from: endDate!)
    }
}
