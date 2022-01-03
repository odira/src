import Foundation
import SwiftUI

struct Shedule: Identifiable {
    var id: UUID = UUID()
    
    var personId: Int?
    var personSurname: String
    var personName: String
    var personMiddleName: String
    var personSex: String?
    var personTabNum: Int
    var personPosition: String?
    var personShiftNum: Int?
    var personSectorsPool: String?
    
    var activityId: Int
    var activityAbbr: String
    var activityActivity: String
    var activityColorString: String
    var activityNote: String?
    
//    var period: DateInterval
    var periodString: String
//    var period: DateInterval
    
    var startDate: Date?
    var endDate: Date?
    var duration: Int
    
    var note: String?
}

extension Shedule {
    var personSexString: String {
        if personSex == "m" {
            return String("муж")
        } else if personSex == "f" {
            return String("жен")
        } else {
            return String("N/A")
        }
    }
}

extension Shedule {
    var activityColor: Color {
        if activityId == 3 { /// отпуск п/г
            return Color(.green)
        } else if activityId == 33 { /// выходной (переработка)
            return Color(.blue)
        } else {
            return Color(.gray)
        }
    }
}

extension Shedule {
    var startDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        return formatter.string(from: startDate!)
    }
}

extension Shedule {
    var endDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        return formatter.string(from: endDate!)
    }
}
