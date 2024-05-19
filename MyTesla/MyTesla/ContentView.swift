//
//  ContentView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import SwiftUI
import Foundation

///Струткра для отображения меню кнопок экрана Tesla
struct ContentView: View {
    
    enum Constant {
        static let nameAvtoTeslaText = "Tesla"
        static let nameLock = "lock"
        static let textFan = "fan"
        static let textLightning = "lightning"
        static let textAvto = "avto"
        }
    
    
    @State private var isCarClose = false
    @State private var tagSelected = 1
    @State private var isTranslitionButton = false
    
    var lisImageControllPanel = [Constant.nameLock,
                                 Constant.textFan,
                                 Constant.textLightning,
                                 Constant.textAvto]
    var body: some View {
                backgroundStackView {
                    VStack {
                        NavigationLink(destination: ClimateView(), isActive: $isTranslitionButton) {
                            EmptyView()
                        }
                        headerView
                        carView
                        controllPanelView
                        Spacer()
                            .frame(height: 40)
                        Spacer()
                    }
                }
        .navigationBarBackButtonHidden(true)
    }
    
    var controllPanelView: some View {
        HStack(spacing: 30) {
            ForEach(lisImageControllPanel.indices, id: \.self) { index in
                if index == 1 {
                    Button {
                        withAnimation {
                            tagSelected = index
                        }
                        isTranslitionButton = true
                    } label: {
                        Image(lisImageControllPanel[index])
                            .resizable()
                            .frame(width: 30, height: 30)
                            .neumorphismSelectedCircleStyle()
                            .overlay (
                                Circle()
                                    .stroke(linearGradient, lineWidth: 2)
                                    .opacity(tagSelected == index ? 1 : 0)
                            )
                    }
                } else {
                    Button {
                        withAnimation {
                            tagSelected = index
                        }
                    } label: {
                        Image(lisImageControllPanel[index])
                            .resizable()
                            .frame(width: 30, height: 30)
                            .neumorphismSelectedCircleStyle()
                            .overlay (
                                Circle()
                                    .stroke(linearGradient, lineWidth: 2)
                                    .opacity(tagSelected == index ? 1 : 0)
                            )
                    }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(Color.background))
        .neumorphismUnSelectedStyle()
        
    }
    var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constant.nameAvtoTeslaText)
                    .font(.verdanaBold(size: 28))
                    .foregroundStyle(.white)
                Image(.km)
            }
            Spacer()
        }
        .padding()
    }
    
    var carView: some View {
        Image(.tesla)
            .resizable()
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.bottom,50)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 10, y: 10)
    }
}
#Preview {
    ContentView()
        .environment(\.colorScheme, .dark)
    
}
