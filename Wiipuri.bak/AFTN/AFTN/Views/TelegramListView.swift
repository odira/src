//
//  TelegramListView.swift
//  AFTN
//
//  Created by Владимир Ильин on 27.07.2021.
//

import SwiftUI

struct TelegramListView: View {
    
    var telegrams: [Telegram] = telegramsList
    
    var body: some View {
        NavigationView {
            List(telegrams) { telegram in
                NavigationLink(
                    destination: TelegramDetailsView(telegram: telegram),
                    label: {
                        Text(telegram.title)
                    })
            }.navigationTitle("AFTN Telegram Codes")
        }
    }
}

struct TelegramListView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramListView(telegrams: telegramsList)
    }
}
