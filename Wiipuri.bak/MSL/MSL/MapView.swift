import SwiftUI

struct MapView: View {
    @GestureState private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Image("20201203 МДП")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFit()
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                            .updating($scale, body: { (value, scale, trans) in
                                scale = scale.magnitude
                            })
                )
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .preferredColorScheme(.dark)
    }
}
