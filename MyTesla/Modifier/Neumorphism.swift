//
//  ModifierView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI

///Структура для неотмеченного стиля элемента с эффектом неоморфизма.
struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: -5)
            .shadow(color: .darkShadow , radius: 5, x: 5, y: 5)
    }
}

///Структура для неотмеченного стиля элемента с эффектом неоморфизма.
struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: 5)
            .shadow(color: .darkShadow, radius: 5, x: -5, y: 5)
        
        
    }
}

///Структура  для стиля неотмеченного круглого элемента с эффектом неоморфизма.
struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all,10)
            .background(Circle().fill(Color.background))
            .neumorphismUnSelectedStyle()
    }
}

///ViewModifier для стиля неотмеченного круглого элемента с рамкой и эффектом неоморфизма.
struct NeumorphismUnSelectedStyleStroke: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(.colorButtonGradientOne),
                                Color(.colorButtonGradientTwo),
                            ],
                            center: .top,
                            startRadius: 10,
                            endRadius: 50
                        )
                    )
                    .rotationEffect(.degrees(-33))
            )
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            stops:
                                [
                                    .init(color: .black, location: 0),
                                    .init(color: .white, location: 2.3),
                                ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.5
                    )
            )
            .shadow(color: .darkShadow, radius: 12, x: -6, y: -6)
            .shadow(color: .darkShadow, radius: 12, x: 6, y: 6)
    }
}
    
/// Структура  для неотмеченной кнопки с эффектом неоморфизма.
struct NeumorphismUnSelectedStyleButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.blue)
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: 4)
                                    .blur(radius: 8)
                                    .offset(x: 2, y: 2)
                            )
                            .overlay {
                                Circle()
                                    .stroke(Color.blue, lineWidth: 8)
                                    .blur(radius: 8) 
                                    .offset(x: -2, y: -2)
                            }
                    } else {
                        Circle()
                            .fill(Color.blue)
                            .shadow(color: Color.darkShadow.opacity(1), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.darkShadow.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

