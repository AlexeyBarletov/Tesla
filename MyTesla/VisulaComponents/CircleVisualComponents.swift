//
//  CircleVisualComponents.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import Foundation
import SwiftUI

/// Представление, содержащее визуальные компоненты круга.
struct CircleVisualComponents: View {
    var unlockView = UnlockView()
    
    @Binding var value: Double
    @State   private var showValue = false
    @State private var dispalayedValue = 0.0
    
    var   color = Color.blue
    var  isStateCircle: Bool
    var  progressStart: Double
    var  progreesEnd: Double
    var body: some View {
        ZStack{
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
            CircularProgressView(progress: value, color: color, progreeStart: progressStart, progreesEnd: progreesEnd)
                .frame(width: 178, height: 178)
            Text("\(value, specifier: "%.0f")°C")
                .font(.verdana(size: 30).bold())
                .foregroundStyle(.white)
                .opacity(isStateCircle ? 1 : 0)
            
            
        }
        .ignoresSafeArea()
    }
}

/// Представление кругового индикатора выполнения.
struct CircularProgressView: View {
    let progress: Double
    var color: Color
    var progreeStart: Double
    var progreesEnd: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(colors: [.lightShadow, .lightShadow], startPoint: .top, endPoint: .bottom).opacity(0.1),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: (progress - progreeStart) / progreesEnd * 2)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
}



















