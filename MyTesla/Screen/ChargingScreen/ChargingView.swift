//
//  ChaningScreen.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 18.05.2024.
//

import Foundation
import SwiftUI

struct ChargingView: View {
    var unlockView = UnlockView()
    var gradient = LinearGradient(colors: [.gradientOne, .colorButtonGradientTwo],
                                  startPoint: .top,
                                  endPoint: .bottom)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            gradient
            
            VStack {
                visualElementNavigationBarView
                imageCarView
                textView
                rectangleView
                Spacer()
            }
            .padding(.top, 70)
        }
        .ignoresSafeArea()
        
        
    }
    
    var textView: some View {
        Text("15%")
            .foregroundStyle(.white)
            .font(.verdanaBold(size: 41))
    }
    
    var imageCarView: some View {
        Image(.teslaCar)
            .resizable()
            .scaledToFit()
    }
    
    var visualElementNavigationBarView: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(.left)
                    .padding()
                    .neumorphismUnSelectedStyleStroke()
            })
            Spacer()
            Text("CHARGING")
                .font(.verdanaBold(size: 20))
            Spacer()
            Button(action: {
            }, label: {
                Image(.setting)
                    .padding()
                    .neumorphismUnSelectedStyleStroke()
            })
        }
        .padding(.horizontal,30)
    }
    
    var rectangleView: some View {
        VStack {
            ZStack {
                MyRectangleFigure()
                    .fill(LinearGradient(colors: [.gradientRectangleOne.opacity(0.20), .gradientRectangleOne.opacity(0.20)], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                    .frame(width: 274, height: 39)
                MyRectangleFigure()
                    .fill(LinearGradient(colors: [.colorTabBarGradientTwo.opacity(0.4), .darkShadow.opacity(0.9)], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                    .frame(width: 273, height: 39)
            }
        }
        
        
    }
    
    struct MyRectangleFigure: Shape {
        func path(in rect: CGRect) -> Path {
                    var path = Path()
                    let width = rect.size.width
                    let height = rect.size.height
                    path.move(to: CGPoint(x: 0, y: 0.61205*height))
                    path.addLine(to: CGPoint(x: 0, y: 0.94872*height))
                    path.addCurve(to: CGPoint(x: 0.01307*width, y: height), control1: CGPoint(x: 0, y: 0.97704*height), control2: CGPoint(x: 0.00585*width, y: height))
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: width, y: 0.61155*height))
                    path.addCurve(to: CGPoint(x: 0.99922*width, y: 0.59411*height), control1: CGPoint(x: width, y: 0.60561*height), control2: CGPoint(x: 0.99974*width, y: 0.5997*height))
                    path.addLine(to: CGPoint(x: 0.94756*width, y: 0.03384*height))
                    path.addCurve(to: CGPoint(x: 0.93527*width, y: 0), control1: CGPoint(x: 0.94569*width, y: 0.01353*height), control2: CGPoint(x: 0.94078*width, y: 0))
                    path.addLine(to: CGPoint(x: 0.06782*width, y: 0))
                    path.addCurve(to: CGPoint(x: 0.05561*width, y: 0.03294*height), control1: CGPoint(x: 0.0624*width, y: 0), control2: CGPoint(x: 0.05754*width, y: 0.0131*height))
                    path.addLine(to: CGPoint(x: 0.00086*width, y: 0.59371*height))
                    path.addCurve(to: CGPoint(x: 0, y: 0.61205*height), control1: CGPoint(x: 0.00029*width, y: 0.59956*height), control2: CGPoint(x: 0, y: 0.60578*height))
                    path.closeSubpath()
                    
                    return path
                }
        }
}



#Preview {
    ChargingView()
}

