import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(periods) { period in
                VStack(alignment: .leading) {
                    HStack {
                        Text(period.personSurname)
                        HStack {
                            Text(period.personName)
                            Text(period.personMiddleName)
                        }
                        .font(.subheadline)
                        .foregroundColor(Color.secondary)
                    }
                    Text(period.activityActivity)
                        .font(.subheadline)
                        .foregroundColor(period.activityColor)
                    HStack(alignment: .center) {
                        Text(period.startDateString)
                        Text("-")
                        Text(period.endDateString)
                    }
                    .font(.subheadline)
                    .foregroundColor(Color.accentColor)
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
