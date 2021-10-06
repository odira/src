import SwiftUI
import Combine

struct ContentView: View {
    @State private var minPressureACC: String = ""
    @State private var minSafeLevelACC: String = "---"
    @State private var buttonIsValid = false
    
//    let pressureFormatter: NumberFormatter = {
//        let pressureFormatter = NumberFormatter()
//        pressureFormatter.numberStyle = .none
//        return pressureFormatter
//    }()
    
    var body: some View {
        VStack {
            Text("ACC Minimum Safe Level")
                .font(.largeTitle)
            HStack {
                Text("FL")
                    .font(.largeTitle)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("\(minSafeLevelACC)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .tracking(10)
            }
            .padding()
            TextField("Enter minimum pressure here", text: $minPressureACC)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(.black)
                .padding()
                .keyboardType(.numberPad)
                .onReceive(Just(minPressureACC)) { newPressure in
                    let filtered = newPressure.filter { "0123456789".contains($0) }
                    if filtered != newPressure {
                        self.minPressureACC = filtered
                    }
                }
            Button(action: {
                let pressure = Double(self.minPressureACC)!
                if pressure < 977.3 {
                    minSafeLevelACC = "080"
                } else if pressure < 999.9 {
                    minSafeLevelACC = "070"
                } else {
                    minSafeLevelACC = "060"
                }
            }) {
                Text("Calculate MSL")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(15)
            }.disabled(!buttonIsValid)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
