import SwiftUI

struct PersonList: View {
    @State private var searchText = ""
    var searchResults: [Person] {
        if searchText.isEmpty {
            return filteredPersons
        } else {
            return filteredPersons.filter { $0.surname.contains(searchText) }
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
            .searchable(text: $searchText, prompt: "Look for surname")
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
