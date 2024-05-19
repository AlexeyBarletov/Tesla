//
//  File.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI

    /// Возвращает шрифт "Verdana-Bold" заданного размера.
    /// - Parameter size: Размер шрифта.
    /// - Returns: Шрифт "Verdana-Bold" заданного размера.
    /// Расширение для `Font`, которое добавляет пользовательские шрифты Verdana Bold и Verdana.
    extension Font {
    static func verdanaBold(size: CGFloat) -> Font {
        return Font.custom("Verdana-Bold", size: size)
    }
    
    /// Возвращает шрифт "Verdana" заданного размера.
    /// - Parameter size: Размер шрифта.
    /// - Returns: Шрифт "Verdana" заданного размера.
    static func verdana(size: CGFloat) -> Font {
        return Font.custom("Verdana", size: size)
    }
}
