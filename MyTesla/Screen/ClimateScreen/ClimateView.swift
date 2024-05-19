//
//  ClimateScreen.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 15.05.2024.
//

import Foundation
import SwiftUI

///Структура для показа экрана о Климат Контроле
struct ClimateView: View {
    
    enum Constant {
        static let link = "Tesla Support"
        static let urlString = "https://www.tesla.com/support "
        static let buttonON = "OK"
        static let description = "Перейти на сайт:"
        static let textClimate = "CLIMATE"
        static let textAc = "Ac"
        static let textFan =  "Fan"
        static let textHeat =  "Heat"
        static let textAvto = "Avto"
        static let imageWind =  "wind"
        static let imageDrop = "drop"
        static let imageTime = "time"
    }
    
    var unlockView = UnlockView()
    var  colorButton = Color.red
    
    @State private var  progres: Double = 15
    @State private var isDisclouzerGrop = true
    @State private var selectedColor = Color.blue
    @State private var isStateOff = false
    @State private var isAlertShown = false
    @State private var progressStart: Double = 15
    @State private var progreesEnd: Double = 30
    @State private var stateProgreess: Double = 0
    
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
                    alertView
                        .opacity(isAlertShown ? 16 : 0)
                        .offset(x: isAlertShown ? 0 : 0, y: isAlertShown ? 0 : -500)
                    Spacer().frame(height: 200)
                    
                }
            }
            .padding(.top,90)
            BottomSheet( selecedColor: $selectedColor, isStateButton: $isStateOff, buttonPlus: $progres)
        }
        
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
    
    var alertView: some View {
        VStack{
            Link(destination: URL(string: Constant.urlString)!, label: {
                VStack(spacing: 10) {
                    Text(Constant.description)
                        .foregroundStyle(.yellow)
                    Text(Constant.link)
                        .font(.system(size: 17))
                        .bold()
                        .underline()
                }
                .transition(.opacity.combined(with: .scale))
            })
            Divider()
                .overlay(
                    Color.red
                )
            Button(Constant.buttonON) {
                withAnimation {
                    isAlertShown = false
                }
            }
            .foregroundColor(.red)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.darkShadow)
        )
        .frame(width: 400, height: 100)
        .offset(y: -400)
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
            Text(Constant.textClimate)
                .font(.verdanaBold(size: 20))
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration: 1)) {
                    isAlertShown = true
                }
            }, label: {
                Image(.setting)
                    .padding()
                    .neumorphismUnSelectedStyleStroke()
            })
        }
        .padding(.horizontal,30)
        
    }
    private  func  makeCustomButton(text: String, imageName: String, selectedColor: Color, progress: Binding<Double>) -> some View {
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
                    Text(Constant.textAc)
                        .frame(width: 50)
                    Spacer()
                    Button(action: {
                    }) {
                        Image(.snowflake)
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
                makeCustomButton(text: Constant.textFan, imageName: Constant.imageWind, selectedColor: colorButton, progress: $stateProgreess)
                makeCustomButton(text: Constant.textHeat, imageName: Constant.imageDrop, selectedColor: colorButton, progress: $stateProgreess)
                makeCustomButton(text: Constant.textAvto, imageName: Constant.imageTime,selectedColor: colorButton, progress: $stateProgreess)
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


