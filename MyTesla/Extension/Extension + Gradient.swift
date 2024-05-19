//
//  Extension + Gradient.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import SwiftUI

    /// Возвращает линейный градиент с предопределенным цветовым диапазоном и направлением.
   /// Расширение для `View`, которое добавляет возможность создания линейного градиента по умолчанию.

extension View {
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)
    }
}
