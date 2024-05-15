//
//  BackGroundView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI

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
