import SwiftUI

struct PersonList: View {
    @ObservedObject var filteredPerson = FilteredPerson()

    var searchResults: [Person] {
        if filteredPerson.bySurname.isEmpty {
            return persons
        } else {
            return persons.filter { $0.surname.contains(filteredPerson.bySurname) }
        }
    }
    
    @State private var showingSheet = false
    
    @State var surname: String = ""
    @State var shiftNum: Int = 0
    
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
                    showingSheet.toggle()
                }) {
                    Image(systemName: "magnifyingglass")
                }
            }
            .sheet(isPresented: $showingSheet) {
                SearchSheet(surname: $surname,
                            shiftNum: $shiftNum
                )
            }
        }
    }
}

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonList()
    }
}
