import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    
    // Storage for Core Data
    let container: NSPersistentContainer
    
    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        // Create 10 example ToDo items
        for _ in 0..<10 {
            let item = ToDoItem(context: controller.container.viewContext)
            item.name = "Создать отчет"
            item.date = "01 Sept 2021"
            item.text = "Тестовый отчет"
        }
        
        return controller
    }()
    
    // An initializer to load Core Data, optionally able to use an in-memory store.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ToDoModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
}
