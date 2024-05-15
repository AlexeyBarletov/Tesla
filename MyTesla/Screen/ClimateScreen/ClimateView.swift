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
         }
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
}


#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}


