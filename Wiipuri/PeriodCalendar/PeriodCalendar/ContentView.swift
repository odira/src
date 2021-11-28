import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(periods) { period in
                Text("OK")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
