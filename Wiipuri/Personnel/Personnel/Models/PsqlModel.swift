import Foundation
import PostgresClientKit
import SwiftUI

var model = PsqlModel()
var persons: [Person] = model.getPersons()

class PsqlModel {
    func getPersons() -> [Person] {
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "127.0.0.1"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .trust
            configuration.database = "terkas"
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let sqlText = "SELECT valid, surname, name, middlename, birthday, mobile_phone, email, tab_num, position, class, shift_num, note FROM person.vw_person;"
            let statement = try connection.prepareStatement(text: sqlText)
            defer { statement.close() }
            
            let cursor = try statement.execute()
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                
                print(columns)
                
                let valid = try columns[0].bool()
                let surname = try columns[1].string()
                let name = try columns[2].string()
                let middleName = try columns[3].string()
                let birthday = try columns[4].string()
                let mobilePhone = try columns[5].int()
                let email = try columns[6].string()
                let tabNum = try columns[7].int()
                let position = try columns[8].string()
                let klass = try columns[9].int()
                let shiftNum = try columns[10].int()
                let note = try? columns[11].string()
                
                persons.append(Person(valid: valid, surname: surname, name: name, middleName: middleName, birthday: birthday, mobilePhone: mobilePhone, email: email, tabNum: tabNum, position: position, klass: klass, shiftNum: shiftNum, note: note))
            }
        } catch {
            print(error)
        }
        
        return persons
    }
}
