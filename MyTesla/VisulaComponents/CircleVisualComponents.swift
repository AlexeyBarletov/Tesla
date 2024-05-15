//
//  CircleVisualComponents.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import Foundation
import SwiftUI

struct CircleVisualComponents: View {
    var unlockView = UnlockView()
    @State var value = 0.0
    @State var showValue = false
    @State var dispalayedValue = 0.0
    var body: some View {
        ZStack{
           // unlockView.gradienScreenWhite
            Circle()
                .stroke(lineWidth: 30)
                .frame(width: 200, height: 200)
                .blur(radius: 10)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.colorCircle.opacity(0.7), .colorCircleTwo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .offset(x: -10, y: -10)

            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 200, height: 200)
                .blur(radius: 10)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.lightShadow,.colorCircleTwo.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .offset(x: -10, y: -10)

            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.lightShadow,.darkShadow.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            Circle()
                .frame(width: 150, height: 150)
                .blur(radius: 1)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.darkShadow,.shadowCircleOne.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .ignoresSafeArea()
    }
}
#Preview {
    CircleVisualComponents()
        .environment(\.colorScheme, .dark)
}

struct NumValue: View {
  //  @ObservedObject var tm = TimerManager()
    var dispalayedValue = 0.0
    var color: Color
    var body: some View {
        Text("\(Int(dispalayedValue * 100))")
            .foregroundColor(color)
    }
}






























