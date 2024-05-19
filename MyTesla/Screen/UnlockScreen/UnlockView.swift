//
//  UnlockView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI

///Структура для описания экрана блокировки
struct UnlockView: View {
    
    enum Constant {
        static let textHi = "Hi"
        static let textWelcome = "Welcome back"
        static let textUnlock = "Unlock"
        static let textLock = "Lock"
    }
    
    @State private var isCarClose = true
    @State private var isShowingMainView = false
    
    var gradienScreen = LinearGradient(gradient: Gradient(colors: [.background, .black, .background]), startPoint: .bottom, endPoint: .top)
    var gradienScreenWhite = LinearGradient(gradient: Gradient(colors: [.lightShadow, .lightShadow]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        ZStack {
            if !isShowingMainView {
                TeslaLogotip()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                            withAnimation {
                                isShowingMainView = true
                            }
                        }
                    }
            } else {
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
        }
    }
    
    var textTeslaView: some View {
        VStack {
            Text(Constant.textHi)
                .font(.verdana(size: 25))
                .foregroundColor(.gray)
            Text(isCarClose ? "" : Constant.textWelcome)
        }
        .opacity(isCarClose ? 0 : 1)
        .font(.verdanaBold(size: 40))
        .foregroundColor(.white)
    }
    
    var carImageView: some View {
        Image(isCarClose ? ImageResource.darkTesla : ImageResource.teslaWhite )
            .resizable()
            .frame(height: 330)
    }
    
    var buttonSettingView: some View {
        NavigationLink(destination: Tab()) {
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
                Text(isCarClose ? Constant.textUnlock : Constant.textLock)
                    .foregroundColor(.white)
                Image(isCarClose ? ImageResource.lockClose : ImageResource.lockOpen)
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

