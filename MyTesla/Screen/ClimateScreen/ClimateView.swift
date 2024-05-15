//
//  ClimateScreen.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import Foundation
import SwiftUI

struct ClimateView: View {
    var circleVisualComponents = CircleVisualComponents()
    var unlockView = UnlockView()
    var bottomSheet = BottomSheet()
    var slider = BidirectionalSlider()
    var sliders = [BidirectionalSlider(), BidirectionalSlider(), BidirectionalSlider(), BidirectionalSlider(), BidirectionalSlider()]
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            bottomSheet
            circleVisualComponents
            VStack {
                visualElementNavigationBarView
                    .padding(.top,180)
                Spacer()
            }
            VStack {
                Spacer()
                visualComponentsButton
            }
        }
        .padding(.bottom, 100)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
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
            Text("CLIMATE")
                .font(.verdanaBold(size: 20))
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(.setting)
                    .padding()
                    .neumorphismUnSelectedStyleStroke()
            })
        }
    }
    func customButton(text: String, imageName: String) -> some View {
        return HStack {
            Text(text)
            Button(action: {
            }) {
                Image(imageName)
                    .frame(width: 1, height: 1)
                    .padding()
                    .neumorphismUnSelectedStyleStroke()
                    .padding()
            }
            VStack(spacing: 1) {
                slider
                    .padding(.horizontal)
            }
        }
    }
    var visualComponentsButton: some View {
        VStack(spacing: -65) {
            customButton(text: "Ac", imageName: "snowflake")
            customButton(text: "Fan", imageName: "wind")
            customButton(text: "Heat", imageName: "drop")
            customButton(text: "Auto", imageName: "time")
        }
        .padding()
    }
}


#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}


