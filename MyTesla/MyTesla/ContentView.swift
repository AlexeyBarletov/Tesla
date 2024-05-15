//
//  ContentView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import SwiftUI
import Foundation

// MARK: Constans

enum Constant {
    static let nameAvtoTeslaText = "Tesla"
    static let kmAvtoTeslaText = ""
}

struct ContentView: View {
    @State var isCarClose = false
    @State var tagSelected = 1
    @State var isTranslitionButton = false
    var lisImageControllPanel = ["lock", "fan", "lightning", "avto"]
    var body: some View {
        NavigationView {
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
        Image(isCarClose ? .imageTeslaGrey : .openTeslaWeith)
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
