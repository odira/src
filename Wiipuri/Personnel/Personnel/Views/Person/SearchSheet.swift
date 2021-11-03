import SwiftUI

struct SearchSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var surname: String
    
    @Binding var shiftNum: Int
    var shifts = [1, 2, 3, 4, 5, 6]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Введите фамилию")
                    TextField("Введите фамилию здесь", text: $surname)
                        .textFieldStyle(.roundedBorder)
                }
                Section {
                    Text("Выберите смену")
                    Picker("Смена", selection: $shiftNum) {
                        ForEach(shifts, id: \.self) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            
            HStack {
                Button("Search") {
                    dismiss()
                }
                .font(.title)
                .padding()
                .background(.green)
                
                Button("Close") {
                    dismiss()
                }
                .font(.title)
                .padding()
                .background(.red)
            }
            .padding()
        }
    }
}

struct SearchSheet_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheet(surname: .constant(""), shiftNum: .constant(4))
    }
}
