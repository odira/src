import SwiftUI

@main
struct ToDoApp: App {
    
    let persistenceController = PersistenceController.shared
    
    // Property to monitor the scene phase
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
