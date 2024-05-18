//
//  ClimateScreen.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import Foundation
import SwiftUI

struct ClimateView: View {
    var unlockView = UnlockView()
   
    @State var progres: Double = 15
    @State var isDisclouzerGrop = true
    @State var selectedColor = Color.blue
    @State var text = ""
    @State var isStateOff = false
    
    @State var progressStart: Double = 15
    @State var progreesEnd: Double = 30
    var colorButton = Color.red
    @State var stateProgreess: Double = 0
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            unlockView.gradienScreenWhite
                VStack {
                    ScrollView {
                    visualElementNavigationBarView
                    Spacer().frame(height: 125)
                    CircleVisualComponents(value: $progres, color: selectedColor, isStateCircle: isStateOff, progressStart: progressStart, progreesEnd: progreesEnd)
                    Spacer().frame(height: 82)
                        visualComponentsButton
                            .padding(.trailing, 40)
                        Spacer().frame(height: 200)
                    }
                }
                .padding(.top,90)
                BottomSheet( selecedColor: $selectedColor, isStateButton: $isStateOff, buttonPlus: $progres)
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
            Button(action: {
            }, label: {
                Image(.setting)
                .padding()
                    .neumorphismUnSelectedStyleStroke()
            })
        }
        .padding(.horizontal,30)
    }
    func makeCustomButton(text: String, imageName: String, selectedColor: Color, progress: Binding<Double>) -> some View {
        HStack(spacing: 19) {
            Text(text)
                 .frame(width: 50)
            Spacer()
            Button(action: {

            }) {
                Image(imageName)
                .frame(width: 50, height: 50)
                    .neumorphismUnSelectedStyleStroke()
            }
                Slider(value: progress, in: 15...30, label: {
                })
            .tint(selectedColor)
            .onAppear {
                UISlider.appearance().setThumbImage(.tumb2, for: .normal)
            }
                 .frame(width: 193)
        }
        .padding(.vertical, 3)

    }
    var visualComponentsButton: some View {
        DisclosureGroup(isExpanded: $isDisclouzerGrop, content: {
            VStack( spacing: 20) {
                HStack(spacing: 19) {
                    Text("Ac")
                         .frame(width: 50)
                    Spacer()
                    Button(action: {
                    }) {
                        Image("snowflake")
                            .renderingMode(.template)
                            .foregroundColor(isStateOff ? Color.blue : Color.red)
                        .frame(width: 50, height: 50)
                            .neumorphismUnSelectedStyleStroke()
                    }
                        Slider(value: $progres, in: 15...30, label: {
                            
                        })
                    .tint(selectedColor)
                    .onAppear {
                        UISlider.appearance().setThumbImage(.tumb2, for: .normal)
                    }
                    .disabled(!isStateOff)
                         .frame(width: 193)
                }
                makeCustomButton(text: "Fan", imageName: "wind", selectedColor: colorButton, progress: $stateProgreess)
                makeCustomButton(text: "Heat", imageName: "drop", selectedColor: colorButton, progress: $stateProgreess)
                makeCustomButton(text: "Auto", imageName: "time",selectedColor: colorButton, progress: $stateProgreess)
            }
            .padding(.top, 10)
        }, label: {
        })
    }
}

#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}


