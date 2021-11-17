import SwiftUI
import Combine

struct ContentView: View {
    @State private var pressureACC: String = ""
    @State private var minSafeLevelACC: String = ""
    @State private var buttonIsValid = false
    
    enum Focus: Hashable {
        case focused
    }
    @FocusState private var isFocused: Focus?
    
//    let pressureFormatter: NumberFormatter = {
//        let pressureFormatter = NumberFormatter()
//        pressureFormatter.numberStyle = .none
//        return pressureFormatter
//    }()
    
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                Text("ACC Minimum Safe Level")
                    .font(.title)
                Text("FL \(minSafeLevelACC)")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 3)
                    )
                Text("Minimum Pressure")
                    .font(.title)
                TextField("Enter minimum pressure here", text: $pressureACC)
                    .font(.title)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 3)
                    )
                    .keyboardType(.numberPad)
                    .onReceive(Just(pressureACC)) { pressure in
                        let filtered = pressure.filter { "0123456789".contains($0) }
                        print(filtered)
                        if filtered != pressure {
                            self.pressureACC = filtered
                        }
                    }
                    .onAppear {
                        isFocused = .focused
                    }
                    .focused($isFocused, equals: .focused)
                Button(action: {
                    let pressure = Double(self.pressureACC)!
                    if pressure < 977.3 {
                        minSafeLevelACC = "080"
                    } else if pressure < 999.9 {
                        minSafeLevelACC = "070"
                    } else {
                        minSafeLevelACC = "060"
                    }
                }, label: {
                    HStack {
                        Image(systemName: "staroflife.circle.fill")
                        Text("Calculate MSL")
                            .font(.title)
                    }
                })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .tabItem {
                Image(systemName: "house.fill")
                Text("MSL")
            }
            
            VStack {
                Image("AIP")
                    .resizable()
                    .scaledToFit()
            }
            .tabItem {
                Image(systemName: "book.closed.fill")
                Text("AIP")
            }
            
            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
