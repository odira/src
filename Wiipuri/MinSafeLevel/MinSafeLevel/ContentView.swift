//
//  ContentView.swift
//  MinSafeLevel
//
//  Created by Владимир Ильин on 24.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var minSafeLevelACC: Int = 0
    @State private var minPressureACC: Int = 0
    @State private var transitionLevelAPP: Int = 0
    @State private var pressureUUWW: Int = 0
    
    let pressureFormatter: NumberFormatter = {
        let pressureFormatter = NumberFormatter()
        pressureFormatter.numberStyle = .none
        return pressureFormatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("ACC Minimum Safe Level")) {
//                        TextField("ACC Minimum Safe Level", text: "\(minSafeLevelACC)")
//                        TextField("Minimum QNH en-route", text: "\(minPressureACC)")
                        Text("ACC Minimum Safe Level \(minSafeLevelACC)")
                        Text("Minimum QNH en-route \(minPressureACC)")
                    }
                    
                    Section(header: Text("APP Transition Level")) {
//                        TextField("APP Transition Level", text: "\(transitionLevelAPP)")
//                        TextField("QNH UUWW", text: "\(pressureUUWW)")
                        Text("APP Transition Level \(transitionLevelAPP)")
                        Text("QNH UUWW \(pressureUUWW)")
                    }
                }

                Button(action: {
                    minSafeLevelACC = 100
                }) {
                    Text("Calculate")
                        .font(.body)
                    Image(systemName: "star")
                }
                .foregroundColor(.white)
                .padding(.all)
                .background(Color.green)
                .cornerRadius(16)
            }
            .navigationTitle("Minimum Safe Level")
        }
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
