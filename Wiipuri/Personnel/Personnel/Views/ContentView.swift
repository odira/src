import SwiftUI

struct ContentView: View {
    var model = PsqlModel()
    
    var body: some View {
        PersonList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
