import Foundation
import SwiftUI

struct Person: Hashable, Codable, Identifiable {
    var id: Int
    var valid: Bool?
    var surname: String
    var name: String
    var middleName: String
    var birthday: String?
    var mobilePhone: Int?
    var email: String?
    var tabNum: Int?
    var position: String?
    var klass: Int?
    var shiftNum: Int?
    var note: String?
    
    var birthDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let date = dateFormatter.date(from: birthday!) ?? Date()
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "dd MMMM yyyy"
        
        return newFormatter.string(from: date)
    }
    
    var phoneNumber: String {
        String(mobilePhone!)
    }
    
    private var sex: String?
    var sexString: String {
        if sex == "m" {
            return String("муж")
        } else if sex == "f" {
            return String("жен")
        } else {
            return String("N/A")
        }
    }
    
    var sexColor: Color {
        if sex == "m" {
            return Color.blue
        } else if sex == "f" {
            return Color.purple
        } else {
            return Color.white
        }
    }
    
    private var imageName: String?
    var image: Image {
        if imageName != nil {
            return Image(imageName!)
        } else {
            return Image("nophoto")
        }
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
