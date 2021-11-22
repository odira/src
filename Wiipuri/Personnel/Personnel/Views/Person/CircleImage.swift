import SwiftUI

struct CircleImage: View {
    var person: Person
    
    var body: some View {
        person.image
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(person.sexColor, lineWidth: 2))
//            .shadow(color: person.sexColor, radius: 10)
//            .border(person.sexColor, width: 6)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(person: persons[0])
    }
}
