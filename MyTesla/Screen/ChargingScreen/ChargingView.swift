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
    
    @State private var progress: Double = 65
    var body: some View {
        ZStack {
            gradient
            
            VStack {
                visualElementNavigationBarView
                imageCarView
                textView
                rectangleView
                scalePercent
                textPercent
                tumbSliderView
                    .frame(width: 300)
                    .padding()
                textTitle
                rectangleCentre
                Spacer()
            }
            .padding(.top, 70)
        }
        .ignoresSafeArea()
    }
    
    var rectangleCentre: some View {
        RoundedRectangle(cornerRadius: 35)
            .fill(.clear)
            .frame(height: 130)
            .overlay {
                RoundedRectangle(cornerRadius: 35)
                    .stroke( Color.gray, lineWidth: 10)
                    .shadow(color: .black.opacity(0.8), radius: 6, x: 6, y: 6)
                    .shadow(color: .white.opacity(0.1), radius: 5, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: 35).inset(by: 5.1))
                    .padding(.horizontal, 26)
                HStack {
                    Text("Nearby Supercharges")
                        .frame(width: 206, height: 24)
                        .padding(.leading,48)
                        .font(.verdana(size: 17)).bold()
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(.up)
                    }
                    .frame(width: 50, height: 50)
                    .neumorphismUnSelectedStyleStroke()

                }

                .padding(.trailing,60)
            }
    }
    
    var scalePercent: some View {
        HStack(spacing: 70) {
            Spacer().frame(width: 125)
            Rectangle()
                .fill(LinearGradient(colors: [.colorGradientCircleOne, .colorGradientAnimationCircleTwo], startPoint: .bottom, endPoint: .topLeading))
                .frame(width: 1, height: 8)
            Rectangle()
                .fill(LinearGradient(colors: [.colorGradientCircleOne, .colorGradientAnimationCircleTwo], startPoint: .bottom, endPoint: .topLeading))
                .frame(width: 1, height: 8)
        }
    }
    
    var textTitle: some View {
        Text("Set Сharge Limit ")
            .foregroundStyle(.gray)
        
        
    }
    
    var tumbSliderView: some View {
        ZStack {
            lineSlider
            Slider(value: $progress, in: 0...100, label: {
                Text("Slider")
            })
            .accentColor(.clear)
            .onAppear {
                UISlider.appearance().setThumbImage(UIImage(resource: .tumb1), for: .normal)
            }
            .padding(.horizontal, 12)
        }
    }
    
    var lineSlider: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.5))
                .frame(width: 278, height: 13)
                .cornerRadius(25)
                .offset(y: -3)
            
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.customDarkGray.opacity(0.9), Color.customDarkGray.opacity(0.7)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 275, height: 11)
                .cornerRadius(25)
            
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.customDarkGray.opacity(0.8), Color.customDarkGray.opacity(0.8)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 265, height: 9)
                .cornerRadius(25)
            
            Rectangle()
                .fill(Color.customDarkGray.opacity(0.3))
                .frame(width: 278, height: 13)
                .cornerRadius(25)
                .offset(y: 3)

        }
    }

    var textPercent: some View {
        HStack(spacing: 30) {
            Spacer()
            Text("75%")
            Text("100%")
                .foregroundStyle(.gray)

        }
        .font(.verdana(size: 13))
        .foregroundStyle(.white)
        .padding(.trailing, 60)
        
    }
    
    var textView: some View {
        Text("\(Int(progress))%")
            .foregroundColor(.white)
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
        .environment(\.colorScheme, .dark)
}

extension Color {
    static let customDarkGray = Color(hex: "#242528")
    static let lightGray = Color(UIColor.lightGray)
}

