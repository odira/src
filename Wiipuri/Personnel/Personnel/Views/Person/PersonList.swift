import SwiftUI

struct PersonList: View {
    @State private var searchText = ""
    @State private var showingSheet = false
    
    @State var surname: String = ""
    @State var shiftNum: Int = 1
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPersons, id: \.self) { person in
                    NavigationLink(destination: PersonDetail(person: person)) {
                        PersonRow(person: person)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .searchable(text: $searchText)
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
    
    var filteredPersons: [Person] {
        if searchText.isEmpty {
            return persons
        } else {
            return persons.filter { person in
//                ($0.shiftNum == shiftNum && $0.surname.contains(searchText))
//                let plist = (person.shiftNum == shiftNum && person.surname.contains(searchText))
                let plist = (person.shiftNum == shiftNum && person.surname.contains(surname))
                return plist
            }
        }
    }
}

struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonList()
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedShift: Int
    var shifts = [1, 2, 3, 4, 5, 6]

    
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("Смена", selection: $selectedShift) {
                        ForEach(shifts, id: \.self) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
            .background(Color.black)
        }
    }
}
