//
//  TelegramDetailsView.swift
//  AFTN
//
//  Created by Владимир Ильин on 27.07.2021.
//

import SwiftUI

struct TelegramDetailsView: View {
    var telegram: Telegram
    
    var body: some View {
        Text(telegram.title)
    }
}

struct TelegramDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TelegramDetailsView(telegram: telegramsList[0])
    }
}
