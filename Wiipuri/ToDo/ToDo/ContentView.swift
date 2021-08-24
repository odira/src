import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: ToDoItem.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ToDoItem.date, ascending: true),
            NSSortDescriptor(keyPath: \ToDoItem.name, ascending: true)
        ],
        predicate: NSPredicate(format: "name == %@", "Important")
    ) var items: FetchedResults<ToDoItem>
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(items, id: \.self) { item in
                        Text("ToDo item: \(item.name ?? "Unknown")")
                    }
                    .onDelete(perform: removeToDoItem)
                }
                .navigationTitle("ToDo List")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Add") {
                            let item = ToDoItem(context: managedObjectContext)
                            item.name = "Important"
                            item.date = "02 Sept 2021"
                            item.text = "Important Test"
                            
                            do {
                                try managedObjectContext.save()
                            } catch {
                                // handle the Core Data error
                            }
                        }
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }
                }
            }
        }
    }
    
    func removeToDoItem(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            managedObjectContext.delete(item)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
