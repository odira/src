import Foundation
import PostgresClientKit

var model = SheduleModel()
var shedule: [Shedule] = model.getShedule()

class SheduleModel {
    private var shedule: [Shedule] = []
    
    func getShedule() -> [Shedule] {
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "127.0.0.1"
            configuration.user = "postgres"
            configuration.ssl = false
            configuration.credential = .trust
            configuration.database = "terkas"
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let sqlQueryText = "SELECT person_id, person_surname, person_name, person_middlename, person_sex, person_tab_num, person_position, person_shift_num, person_sectors_pool, activity_id, activity_abbr, activity_activity, activity_color, activity_note, period, start_date, end_date, duration, note FROM calendar.vw_empl_shedule ORDER BY period,person_surname"

            let statement = try connection.prepareStatement(text: sqlQueryText)
            defer { statement.close() }
            
            let cursor = try statement.execute()
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                
                let personId = try? columns[0].int()
                let personSurname = try columns[1].string()
                let personName = try columns[2].string()
                let personMiddleName = try columns[3].string()
                let personSex = try? columns[4].string()
                let personTabNum = try columns[5].int()
                let personPosition = try? columns[6].string()
                let personShiftNum = try? columns[7].int()
                let personSectorsPool = try? columns[8].string()
                
                let activityId = try columns[9].int()
                let activityAbbr = try columns[10].string()
                let activityActivity = try columns[11].string()
                let activityColorString = try columns[12].string()
                let activityNote = try? columns[13].string()

                let period = try? columns[14].postgresValue
                print(period!)
                print(type(of: period))
                
//                if let periodNew = period {
//                    print(periodNew)
//                }
                
                var start = try? columns[15].date()
                var end = try? columns[16].date()
                var duration = try columns[17].int()

                let note = try? columns[18].string()
                
                let utcTimeZone = TimeZone(secondsFromGMT: 0)!
                let startDate = start?.date(in: utcTimeZone) ?? Date()
                let endDate = end?.date(in: utcTimeZone) ?? Date()

                self.shedule.append(
                    Shedule(
                        personId: personId, personSurname: personSurname, personName: personName, personMiddleName: personMiddleName, personSex: personSex, personTabNum: personTabNum, personPosition: personPosition, personShiftNum: personShiftNum, personSectorsPool: personSectorsPool, activityId: activityId, activityAbbr: activityAbbr, activityActivity: activityActivity, activityColorString: activityColorString, activityNote: activityNote,
                        period: DateInterval(start: Date(), end: Date()),
                        startDate: startDate,
                        endDate: endDate,
                        duration: duration,
                        note: note
                )
                )
            }
        } catch {
            print(error)
        }
        
        return shedule
    }
}
