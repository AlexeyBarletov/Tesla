//
//  Extension + Hex.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 18.05.2024.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        var hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hex = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex

        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xff0000) >> 16) / 255
        let green = Double((rgbValue & 0x00ff00) >> 8) / 255
        let blue = Double(rgbValue & 0x0000ff) / 255

        self.init(red: red, green: green, blue: blue)
    }
}
