import SwiftUI

struct PersonDetail: View {
    var person: Person
    
    var body: some View {
        ScrollView {
            Image("cup")
                .resizable()
                .scaledToFit()
            
            CircleImage(person: person)
                .offset(y: -100)
                .padding(.bottom, -100)

            VStack(alignment: .leading) {
                Text(person.surname)
                    .font(.title)
                    .bold()
                
                HStack {
                    Text(person.name)
                    Text(person.middleName)
                }
                .font(.title)
                .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        if person.position != nil {
                            Text("\(person.position!)")
                        } else {
                            Text("No positional data")
                        }
                        Spacer()
                        Text("смена \(person.shiftNum!) РДЦ")
                    }
                    HStack {
                        Text("Табельный номер \(person.tabNumString)")
                        Spacer()
                        Text("\(person.klass!) класс")
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Пол:")
                        Text("\(person.sexString)")
                            .foregroundColor(person.sexColor)
                    }
                    HStack {
                        Text("Дата рождения:")
                        Text(person.birthday!, style: .date)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    if person.mobilePhone != nil {
                        Text("Mobile phone \(person.mobilePhone!)")
                    } else {
                        Text("No mobile phone number")
                    }
                    
                    if person.email != nil {
                        Text(person.email!)
                    } else {
                        Text("No email")
                    }
                }
                
                Divider()
                
                Text("Дополнительные сведения")
                    .font(.title2)

                if person.note != nil {
                    Text(person.note!)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } else {
                    Text("Дополнительные сведения отсутствуют")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetail(person: persons[10])
    }
}
