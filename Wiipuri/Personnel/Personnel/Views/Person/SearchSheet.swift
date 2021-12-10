import SwiftUI

struct SearchSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var shifts = [1, 2, 3, 4, 5, 6]
    
    @ObservedObject var filteredPerson: FilteredPerson
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Введите фамилию")
                    TextField("Введите фамилию здесь", text: $filteredPerson.bySurname)
                        .textFieldStyle(.roundedBorder)
                }
                Section {
                    Text("Выберите смену")
                    Picker("Смена", selection: $filteredPerson.shiftNum) {
                        ForEach(shifts, id: \.self) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            
//            HStack {
//                Button(role: .none, action: {
//                    dismiss()
//                }, label: {
//                    Text("Search")
//                        .frame(maxWidth: .infinity)
//                })
//                    .buttonStyle(.bordered)
//                    .tint(.green)
//
//                Button(role: .destructive, action: {
//                    dismiss()
//                }, label: {
//                    Text("Close")
//                        .frame(maxWidth: .infinity)
//                })
//                    .buttonStyle(.bordered)
//                    .tint(.red)
//            }
//            .padding()
        }
    }
}

struct SearchSheet_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheet(filteredPerson: FilteredPerson())
    }
}
