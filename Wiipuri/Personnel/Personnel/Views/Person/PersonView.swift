import SwiftUI

struct PersonView: View {
    
    let person: Person
    
    var body: some View {
        TabView {
            GeneralTabView(person: person)
                .tabItem {
                    Image(systemName: "person")
                    Text("General")
                }
            
            AdmissionsTabView(person: person)
                .tabItem {
                    Image(systemName: "paperclip")
                    Text("Admissions")
                }
        }
        .navigationBarTitle(Text(person.surname), displayMode: .inline)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(person: PersonList.persons.first!)
    }
}


