//
//  Telegram.swift
//  AFTN
//
//  Created by Владимир Ильин on 27.07.2021.
//

import SwiftUI

struct Telegram: Identifiable {
    var id = UUID()
    var title: String
}

let telegramsList = [
    Telegram(title: "AFIL"),
    Telegram(title: "ALD"),
    Telegram(title: "ALR")
]

