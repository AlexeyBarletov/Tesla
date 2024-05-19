//
//  BackGroundView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI


/// Добавляет ZStack с заданными градиентными цветами в качестве фонового.
/// - Parameters:
///   - content: Замыкание, содержащее контент, который будет отображаться поверх градиентного фона.
/// - Returns: Новое представление с ZStack в качестве фонового, содержащее указанные градиентные цвета.
/// Расширение для `View`, которое добавляет фоновый ZStack с градиентными цветами.
extension View {
    func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [.gradientOne, .colorButtonGradientTwo],
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
}

/// Расширение для `View`, которое добавляет фоновое представление с градиентом.
    /// Добавляет ZStack с указанным градиентом в качестве фонового.
    /// - Parameters:
    ///   - colors: Массив цветов для создания градиента.
    ///   - startPoint: Точка начала градиента.
    ///   - endPoint: Точка окончания градиента.
    ///   - content: Замыкание, содержащее контент, который будет отображаться поверх градиента.
    /// - Returns: Новое представление с ZStack в качестве фонового, содержащее указанный градиент.
 extension View {
    func backgroundGradientView<Content: View>(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint, content: () -> Content) -> some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            content()
        }
    }
}
