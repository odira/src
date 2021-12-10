import SwiftUI

struct PersonList: View {
    @ObservedObject var filteredPerson = FilteredPerson()
    @State private var showingSearchSheet = false
    
    var searchResults: [Person] {
        if filteredPerson.bySurname.isEmpty {
            if filteredPerson.shiftNum != 0 {
                return persons.filter { $0.shiftNum == filteredPerson.shiftNum }
            }
            return persons
        } else {
            return persons.filter { $0.surname.contains(filteredPerson.bySurname) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults) { person in
                    NavigationLink(destination: PersonDetail(person: person)) {
                        PersonRow(person: person)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .searchable(text: $filteredPerson.bySurname, prompt: "Look for surname")
            .navigationTitle("Список работников")
            .toolbar {
                Button(action: {
                    showingSearchSheet.toggle()
                }) {
                    Image(systemName: "magnifyingglass")
                }
            }
            .sheet(isPresented: $showingSearchSheet) {
                SearchSheet(filteredPerson: filteredPerson)
            }
        }
    }
}

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonList()
    }
}
