import SwiftUI

struct ContentView: View {
    
    var persons: [Person] = PersonList.persons
    
    var body: some View {
        NavigationView {
            List(persons) { person in
                    PersonCell(person: person)
            }
            .navigationTitle("Список сотрудников")
        }
    }
}

struct PersonCell: View {
    
    var person: Person
    
    var body: some View {
        NavigationLink(destination: PersonView(person: person)) {
            Image(person.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
                .overlay(Circle())
                .foregroundColor(Color.clear)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(person.surname)
                    .font(.headline)
                Text(person.name + " " + person.middleName)
                    .font(.subheadline)
                Text(person.birthday)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

