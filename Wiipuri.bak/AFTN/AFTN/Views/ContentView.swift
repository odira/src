//
//  ContentView.swift
//  AFTN
//
//  Created by Владимир Ильин on 27.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    private var documentURL13 = Bundle.main.url(forResource:"13", withExtension: "pdf")
    private var documentURLPRAPI = Bundle.main.url(forResource: "PRAPI", withExtension: "pdf")
    
    var body: some View {
        TabView {
            TelegramListView()
                .tabItem {
                    Image(systemName: "list.triangle")
                    Text("AFTN")
                }
            
            PDFKitView(url: documentURL13!)
                .tabItem {
                    Image(systemName: "doc")
                    Text("TC-13")
                }
            
            PDFKitView(url: documentURLPRAPI!)
                .tabItem {
                    Image(systemName: "doc")
                    Text("ПРАПИ")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
