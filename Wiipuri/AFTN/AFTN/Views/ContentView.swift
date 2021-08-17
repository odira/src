//
//  ContentView.swift
//  AFTN
//
//  Created by Владимир Ильин on 27.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    private var documentURL = Bundle.main.url(forResource:"13", withExtension: "pdf")
    
    var body: some View {
        TabView {
            TelegramListView()
                .tabItem {
                    Image(systemName: "list.triangle")
                    Text("AFTN")
                }
            PDFKitView(url: documentURL!)
                .tabItem {
                    Image(systemName: "doc")
                    Text("TC-13")
                }
        }
//        .accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
