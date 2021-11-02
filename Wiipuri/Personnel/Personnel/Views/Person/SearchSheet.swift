import SwiftUI

struct SearchSheet: View {
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

struct SearchSheet_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheet(selectedShift: .constant(4))
    }
}
