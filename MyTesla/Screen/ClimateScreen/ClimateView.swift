//
//  ClimateScreen.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import Foundation
import SwiftUI

struct ClimateView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        backgroundStackView {
                VStack {
                    visualElementNavigationBarView
                        .padding()
                    Spacer()
                    visualComponentRectangle
                    Spacer()

                }
                .navigationBarBackButtonHidden(true)
            }
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
    
    var visualComponentRectangle: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(colors: [.gradientRectangleOne, .gradientRectangleTwo], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 168, height: 168)
                .shadow(color: .lightShadow, radius: 20, x: -12, y: -12)
                .shadow(color: .darkShadow, radius: 20, x: 12, y: 12)
            Circle()
                .fill(LinearGradient(colors: [.black.opacity(0.90), .clear], startPoint:.topLeading, endPoint: .bottomTrailing))
                .frame(width: 119, height: 119)
                .background(.rectangleBar)
                .clipShape(.rect(cornerRadius: 60))
   
        }
    }
}

#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}


