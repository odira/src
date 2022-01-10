import SwiftUI

struct PersonRow: View {
    var person: Person
    
    var body: some View {
        HStack {
            person.image
                .resizable()
                .frame(width: 50, height: 50)
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(person.surname)
                    .bold()
                HStack {
                    Text(person.name)
                    Text(person.middleName)
                }
                .font(.subheadline)
            }
            
            Spacer()
        }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PersonRow(person: persons[0])
            PersonRow(person: persons[1])
        }
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
