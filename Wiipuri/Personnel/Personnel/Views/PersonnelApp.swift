import SwiftUI

@main
struct PersonnelApp: App {
    @StateObject var personFilters: PersonFilters = PersonFilters()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(personFilters)
        }
    }
}
