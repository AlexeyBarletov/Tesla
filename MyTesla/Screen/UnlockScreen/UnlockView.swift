//
//  UnlockView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI

struct UnlockView: View {
    @State var isCarClose = true
    var gradienScreen = LinearGradient(gradient: Gradient(colors: [.background, .black, .background]), startPoint: .bottom, endPoint: .top)
    var gradienScreenWhite = LinearGradient(gradient: Gradient(colors: [.lightShadow, .lightShadow]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(isCarClose ? gradienScreen : gradienScreenWhite)
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 50) {
                    buttonSettingView
                    textTeslaView
                    carImageView
                    closedCarController
                }
            }
        }
    }
    
    var textTeslaView: some View {
        VStack {
            Text("Hi")
                .font(.custom("Verdana", size: 25))
                .foregroundColor(.gray)
            Text(isCarClose ? "" : "Welcome back")
        }
        .opacity(isCarClose ? 0 : 1)
        .font(.custom("Verdana-Bold", size: 40))
        .foregroundColor(.white)
    }
    
    var carImageView: some View {
        Image(isCarClose ? ImageResource.darkTesla : ImageResource.teslaWhite )
            .resizable()
            .frame(height: 330)
    }
    
    var buttonSettingView: some View {
        NavigationLink(destination: ContentView()) {
            Spacer()
            Image(.settingButton)
        }
    }
    
    var closedCarController: some View {
        Button {
            withAnimation {
                isCarClose.toggle()
            }
        } label: {
            HStack {
                Text(isCarClose ? "Unlock" : "Lock")
                    .foregroundColor(.white)
                Image(isCarClose ? "lockClose" : "lockOpen")
                    .renderingMode(.template)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(Color.background))
            .neumorphismSelectedStyle()
        }
    }
}
#Preview {
    UnlockView()
        .environment(\.colorScheme, .dark)
}
