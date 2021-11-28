import Foundation
import PostgresClientKit

var model = PeriodModel()
var periods: [Period] = model.getPeriods()

class PeriodModel {
    private var periods: [Period] = []
    
    func getPeriods() -> [Period] {
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "127.0.0.1"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .trust
            configuration.database = "terkas"
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
//            let sqlQueryText = "SELECT person_id, person_surname, person_name, person_middlename, person_tab_num, person_position, person_shift_num, person_sectors_pool, activity_id, activity_abbr, activity_activity, activity_color, activity_note, valid, period, start_date, end_date, duration, note FROM calendar.vw_empl_shedule"
            let sqlQueryText = "SELECT person_id, person_surname, person_name, person_middlename, person_tab_num, person_position, person_shift_num, person_sectors_pool, activity_id, activity_abbr, activity_activity, activity_color, activity_note, valid, note FROM calendar.vw_empl_period"
            let statement = try connection.prepareStatement(text: sqlQueryText)
            defer { statement.close() }
            
            let cursor = try statement.execute()
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                
                let personId = try? columns[0].int()
                let personSurname = try? columns[1].string()
                let personName = try? columns[2].string()
                let personMiddleName = try? columns[3].string()
                let personTabNum = try? columns[4].int()
                let personPosition = try? columns[5].string()
                let personShiftNum = try? columns[6].int()
                let personSectorsPool = try? columns[7].string()
                
                let activityId = try? columns[8].int()
                let activityAbbr = try? columns[9].string()
                let activityActivity = try? columns[10].string()
                let activityColor = try? columns[11].string()
                let activityNote = try? columns[12].string()
                
                let valid = try columns[13].bool()
                
//                var period: try columns[14].date
//                var start: Date
//                var end: Date
//                var duration: DateInterval
                
                let note = try columns[14].string()
                
                self.periods.append(
                Period(
                    personId: personId, personSurname: personSurname, personName: personName, personMiddleName: personMiddleName, personTabNum: personTabNum, personPosition: personPosition, personShiftNum: personShiftNum, personSectorsPool: personSectorsPool, activityId: activityId, activityAbbr: activityAbbr, activityActivity: activityActivity, activityColor: activityColor, activityNote: activityNote, valid: valid,
//                    period: nil, start: nil, end: nil, duration: nil,
                    note: note
                )
                )
            }
        } catch {
            print(error)
        }
        
        return periods
    }
}
