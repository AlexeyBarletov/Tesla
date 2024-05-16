//
//  BottomSheet.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import SwiftUI
import Foundation
struct BottomSheet: View {
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    @State private var lastMenuOffsetY: CGFloat = 0.0
    var neumorphismUnSelectedStyleButoon  = NeumorphismUnSelectedStyleButton()
    @Binding var selecedColor: Color
    @Binding var isStateButton: Bool
    @Binding var buttonPlus: Double
    
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { value in
                let maxHeight = UIScreen.main.bounds.height - 700
                
                withAnimation {
                    if -currentMenuOffsetY > maxHeight / 2 {
                        currentMenuOffsetY = -maxHeight
                    } else {
                        currentMenuOffsetY = 0
                    }
                    lastMenuOffsetY = currentMenuOffsetY
                }
            }
    }
    func onChangeMenuOffset() {
        DispatchQueue.main.async {
            currentMenuOffsetY = gestureOffset.height +
            lastMenuOffsetY
        }
    }
    var body: some View {
        ZStack {
            VStack {
                visualComponentsCapsule
                ZStack {
                    visualComponentBottomShet
                }
                visualComponentPoliter
                visualComponentsView
                Spacer()
                
            }
            .frame(height: UIScreen.main.bounds.height + 300)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.colorCircle)))
            .ignoresSafeArea(.all, edges: .bottom)
            .offset(y: UIScreen.main.bounds.height )
            .offset(y: currentMenuOffsetY)
            .gesture(dragGesture)
        }
        .ignoresSafeArea(edges: .top)
    }
    
    var visualComponentsCapsule: some View {
        Capsule()
            .fill(.black)
            .frame(width: 50, height: 3)
            .padding(.top)
    }
    var visualComponentBottomShet: some View {
        HStack(spacing: 40) {
            VStack(alignment: .leading, spacing: 5) {
                Text(" A/C \(isStateButton ? "On" : "Off")")
                    .font(.verdanaBold(size: 20))
                Text("Tap to turn of or swipe up\nfor a fast setup")
                    .font(.verdana(size: 17))
                    .foregroundStyle(.gray)
            
            }
            Button(action: {
                isStateButton.toggle()
                buttonPlus = 15

            }) {
                
                Image(systemName: "power")
            }
            .buttonStyle(NeumorphismUnSelectedStyleButton())
            .padding()
        }
    }
    
    var visualComponentPoliter: some View {
        HStack(spacing: 40) {
            ColorPicker("", selection: $selecedColor)
            Button(action:
                    {
                withAnimation {
                    if buttonPlus >= 16  {
                        buttonPlus -= 1
                    }
                }
              
                
            }) {
                Image(.left2)
            }
            .disabled(!isStateButton)
            .padding()
            Text("\(buttonPlus, specifier: "%.0f")°C")
                .frame(width: 62, height: 40)
                .font(.verdanaBold(size: 15))
                .padding()
            Button(action: {
                withAnimation {
                    if buttonPlus >= 15 && buttonPlus < 30 {
                        buttonPlus += 1
                    }
                }
            }) {
                Image(.ride2)
            }
            .disabled(!isStateButton)
            Image(.door)
        }
        .padding(.trailing, 45)
    }
 
    var visualComponentsView: some View {
        HStack(alignment: .center ) {
            Text("On")
                .font(.verdana(size: 17))
                .foregroundStyle(.gray)
                .padding(.bottom)
            Spacer()
            Text("Vent")
                .font(.verdana(size: 17))
                .foregroundStyle(.gray)
                .padding(.bottom)
        }
        .padding(.horizontal, 35)
    }
}



































