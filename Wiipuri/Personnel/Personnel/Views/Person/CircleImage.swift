import SwiftUI

struct CircleImage: View {
    var person: Person
    
    var body: some View {
        person.image
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(color: person.sexColor, radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(person: persons[0])
    }
}
