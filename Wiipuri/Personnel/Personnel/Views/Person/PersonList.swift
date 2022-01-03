import SwiftUI

struct PersonList: View {
    @State private var showingSearchSheet = false
    @EnvironmentObject var personFilters: PersonFilters
    
    var filteredPersons: [Person] {
        var results = persons
        
        switch personFilters.byValid {
        case .all:
            break
        case .valid:
            results.removeAll(where: {!$0.valid!})
        case .invalid:
            results.removeAll(where: {$0.valid!})
        default:
            break
        }
        
        if !personFilters.byName.isEmpty {
            results = results.filter { $0.name.contains(personFilters.byName) }
        }
        if !personFilters.byMiddlename.isEmpty {
            results = results.filter { $0.middleName.contains(personFilters.byMiddlename) }
        }
        if !personFilters.bySurname.isEmpty {
            results.removeAll(where: {$0.surname.range(of: personFilters.bySurname, options: .caseInsensitive) == nil})
        }
        
        results = results.filter({ personFilters.byShiftNum == 0 || $0.shiftNum == personFilters.byShiftNum })
        
        return results
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPersons) { person in
                    NavigationLink(destination: PersonDetail(person: person)) {
                        PersonRow(person: person)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .searchable(text: $personFilters.bySurname, prompt: "Look for surname")
            .navigationTitle("Список работников")
            .toolbar {
                HStack {
                    Button(action: {
                        showingSearchSheet.toggle()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    Button(action: {
                        personFilters.update()
                    }) {
                        Image(systemName: "repeat")
                    }
                }
            }
            .sheet(isPresented: $showingSearchSheet) {
                SearchSheet(personFilters: personFilters)
            }
        }
    }
}

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonList()
            .environmentObject(PersonFilters())
    }
}
