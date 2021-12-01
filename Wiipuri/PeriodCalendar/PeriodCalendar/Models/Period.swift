import Foundation
import SwiftUI

struct Period: Identifiable {
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
    var startDate: Date?
    var endDate: Date?
//    var duration: DateInterval
    
    var note: String?
}

extension Period {
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

extension Period {
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
