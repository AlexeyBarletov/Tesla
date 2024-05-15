//
//  ModifierView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI

struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: -5)
            .shadow(color: .darkShadow , radius: 5, x: 5, y: 5)
    }
}

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow, radius: 5, x: 5, y: 5)
            .shadow(color: .darkShadow, radius: 5, x: -5, y: 5)
        
        
    }
}
struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all,10)
            .background(Circle().fill(Color.background))
            .neumorphismUnSelectedStyle()
    }
}

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
                .shadow(color: .lightShadow, radius: 12, x: -6, y: -6)
                .shadow(color: .darkShadow, radius: 12, x: 6, y: 6)
        }
}

///Расширения для Модификаторов
extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
    
    func neumorphismUnSelectedStyleStroke() -> some View {
        modifier(NeumorphismUnSelectedStyleStroke())
    }
}
