import Foundation
import SwiftUI
import PostgresClientKit

struct Person: Identifiable {
    var id: UUID? = UUID()
    var valid: Bool?
    var surname: String
    var name: String
    var middleName: String
    var sex: String?
    var birthday: PostgresDate?
    var mobilePhone: Int?
    var email: String?
    var tabNum: Int?
    var position: String?
    var klass: Int?
    var shiftNum: Int?
    var sectorsPool: String?
    var servicePeriod: DateInterval?
    var note: String?
    
    var sexColor: Color {
        if sex == "m" {
            return Color.blue
        } else if sex == "f" {
            return Color.purple
        } else {
            return Color.white
        }
    }
    
    var image: Image {
        if !imageName.isEmpty {
            return Image(imageName)
        } else {
            return Image("nophoto")
        }
    }
}

extension Person {
    var sexString: String {
        if sex == "m" {
            return String("муж")
        } else if sex == "f" {
            return String("жен")
        } else {
            return String("N/A")
        }
    }
}

extension Person {
    var birthDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        /// The UTC/GMT time zone.
        let utcTimeZone = TimeZone(secondsFromGMT: 0)!
        
        return formatter.string(from: birthday!.date(in: utcTimeZone))
    }
}

extension Person {
    var age: Int? {
        /// The UTC/GMT time zone.
        let utcTimeZone = TimeZone(secondsFromGMT: 0)!
        let date1 = birthday!.date(in: utcTimeZone)

        let calendar = Calendar.current
        let startdate = calendar.startOfDay(for: date1)
        let enddate = calendar.startOfDay(for: Date())

        let components = calendar.dateComponents([.year], from: startdate, to: enddate)
        return components.year
    }
}

extension Person {
    var tabNumString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.groupingSeparator = ""
        
        let number = NSNumber(value: tabNum!)
        return formatter.string(from: number)!
    }
}

extension Person {
    var phoneNumber: String {
        let phone = String(mobilePhone!)
        if phone.isEmpty {
            return "Mobile phone N/A "
        }
        
        var output = "+7 ("
        
        var index = phone.index(phone.startIndex, offsetBy: 0)
        output = output + String(phone[index])
        
        index = phone.index(phone.startIndex, offsetBy: 1)
        output = output + String(phone[index])
        
        index = phone.index(phone.startIndex, offsetBy: 2)
        output = output + String(phone[index]) + ") "
        
        index = phone.index(phone.startIndex, offsetBy: 3)
        output = output + String(phone[index])
        
        index = phone.index(phone.startIndex, offsetBy: 4)
        output = output + String(phone[index])
        
        index = phone.index(phone.startIndex, offsetBy: 5)
        output = output + String(phone[index]) + " "
        
        index = phone.index(phone.startIndex, offsetBy: 6)
        output = output + String(phone[index])
        
        index = phone.index(phone.startIndex, offsetBy: 7)
        output = output + String(phone[index]) + " "
        
        index = phone.index(phone.startIndex, offsetBy: 8)
        output = output + String(phone[index])
        
        index = phone.index(phone.startIndex, offsetBy: 9)
        output = output + String(phone[index])

        return output
    }
}

extension Person {
    var imageName: String {
        if tabNum != nil {
            let tabNumString = String(tabNum!)
            return tabNumString
        } else {
            return String()
        }
    }
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.numberStyle = .none
        return formatter
    }()
}

extension Int {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}