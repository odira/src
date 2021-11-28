import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(periods) { period in
                VStack(alignment: .leading) {
                    Text(period.personSurname!)
                    HStack {
                        Text(period.startDateString)
                        Spacer()
                        Text(period.endDateString)
                    }
                    .font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
