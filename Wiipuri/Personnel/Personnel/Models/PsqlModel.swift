import Foundation
import PostgresClientKit
import SwiftUI

var model = PsqlModel()
var persons: [Person] = model.getPersons()

class PsqlModel {
    
    private var persons: [Person] = []
    
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
            
            let sqlText = "SELECT valid, surname, name, middlename, sex, birthday, mobile_phone, email, tab_num, position, class, shift_num, sectors_pool, note FROM person.vw_person;"
            let statement = try connection.prepareStatement(text: sqlText)
            defer { statement.close() }
            
            let cursor = try statement.execute()
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                
                let valid = try columns[0].bool()
                let surname = try columns[1].string()
                let name = try columns[2].string()
                let middleName = try columns[3].string()
                let sex = try? columns[4].string()
                let birthday = try? columns[5].date()
                let mobilePhone = try? columns[6].int()
                let email = try? columns[7].string()
                let tabNum = try? columns[8].int()
                let position = try? columns[9].string()
                let klass = try? columns[10].int()
                let shiftNum = try? columns[11].int()
                let sectorsPool = try? columns[12].string()
                let note = try? columns[13].string()
                
                self.persons.append(Person(valid: valid, surname: surname, name: name, middleName: middleName, sex: sex, birthday: birthday, mobilePhone: mobilePhone, email: email, tabNum: tabNum, position: position, klass: klass, shiftNum: shiftNum, sectorsPool: sectorsPool, note: note))
            }
        } catch {
            print(error)
        }
        
        return persons
    }
}
