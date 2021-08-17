import SwiftUI

//let columns: [GridItem] = [GridItem(.flexible()),
//                           GridItem(.flexible()),
//                           GridItem(.flexible()),]

//let columnPerson: [GridItem] = [GridItem(.flexible())]
//let columnsDates: [GridItem] = Array(repeating: .init(.flexible(), spacing: 8), count: 37)

struct ContentView: View {
    
    @State private var month = "December"
    @State private var year = "2022"
    
    @State private var person = "Владимир Ильин"

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                
                ControlsBar(month: month, year: year)
                    .padding()
            
                List(0 ..< 50) { item in
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        
                        Text("\(person)")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .frame(width: geometry.size.width / 7, alignment: .leading)
                    
                    HStack {
                        ForEach(-2..<34) { i in
                            Text("\(i)")
                                .frame(maxWidth: .infinity)
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(2)
                                .background(Color.yellow)
                        }
                    }
                    .frame(width: geometry.size.width / 7 * 6)

                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 2160, height: 1620))
    }
}

struct ControlsBar: View {
    
    var month: String
    var year: String
    
    var body: some View {
        HStack {
            Spacer()
            
            Image(systemName: "arrowtriangle.left.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
            
            Text("\(month)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(systemName: "arrowtriangle.right.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
            
            Spacer()
            
            Image(systemName: "arrowtriangle.left.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)

            Text("\(year)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(systemName: "arrowtriangle.right.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
            
            Spacer()
        }
    }
}
