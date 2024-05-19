//
//  TabBarView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 18.05.2024.
//

import Foundation
import SwiftUI

///Стурктура отображает Кастомный ТабБар
struct CustomTabBar: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY - 10))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX + 32, y: rect.midY - 26),
            control: CGPoint(x: rect.midX + 10, y: rect.midY - 10
                            ))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX + 100, y: rect.midY - 40),
            control: CGPoint(x: rect.midX + 50, y: rect.midY - 40)
        )
        path.addLine(to: CGPoint(x: rect.maxX - 40, y: rect.midY - 40))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY - 10),
            control: CGPoint(x: rect.maxX - 10, y: rect.midY - 40)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - 40, y: rect.midY + 40),
            control: CGPoint(x: rect.maxX, y: rect.midY + 40)
        )
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + 40))
        path.addLine(to: CGPoint(x: 40, y: rect.midY + 40))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.midY - 10),
            control: CGPoint(x: 0, y: rect.midY + 40)
        )
        path.addQuadCurve(
            to: CGPoint(x: 40, y: rect.midY - 40),
            control: CGPoint(x: 15, y: rect.midY - 43)
        )
        path.addLine(to: CGPoint(x: rect.midX - 100, y: rect.midY - 40))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX - 32, y: rect.midY - 24),
            control: CGPoint(x: rect.midX - 50, y: rect.midY - 40)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.midY - 10),
            control: CGPoint(x: rect.midX - 10, y: rect.midY - 10)
        )
        return path
    }
}

/// Структура, представляющая пользовательский ключ предпочтений для элемента вкладки.
struct TabItemPreferenseKey: PreferenceKey {
    static var defaultValue: [TabItem] = []
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
        
    }
}

/// Структура, представляющая модификатор представления для элемента вкладки.

struct TabItemModifire: ViewModifier {
    
    let tabBarItem: TabItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabItemPreferenseKey.self, value: [tabBarItem])
    }
    
}

extension View {
    func myTabItem(_ label: () -> TabItem) -> some View {
        modifier(TabItemModifire(tabBarItem: label()))
    }
    
}
/// Обобщенная структура  представляющая пользовательский вид с вкладками.
struct CustomTabView<Content: View>: View {

    @Binding var selection: Int
    @Namespace private var tabBarItem
    @State  private var  tabs: [TabItem] = [
        .init( icont: "avto1"),
        .init( icont: "stats"),
        .init( icont: "more"),
        .init(icont: "explore")
    ]
    
    var gradientTop = LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)

    private var content: Content
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            ZStack {
                CustomTabBar()
                    .fill(.colorTabBar)
                HStack {
                    tabsView
                }
            }
            .padding(.top,80)
            .frame(width: 397, height: 78)
            Spacer()
        }
        .onPreferenceChange(TabItemPreferenseKey.self) { value in
            self.tabs = value
        }
    }
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
    }
    
     var tabsView: some View {
        ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
            Image(element.icont)
            
                .background(
                    ZStack {
                        if selection == index {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top))
                            .blur(radius: 18)
                            .opacity(0.4)
                            .scaleEffect(CGSize(width: 1, height: 1.1))
                            .offset(y: 4)
                                .matchedGeometryEffect(id: "tabBarItem", in: tabBarItem)

                        }
                    }
                )
            
                .onTapGesture {
                    withAnimation {
                        selection = index
                    }
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(selection == index ? .blue : .gray)
            Spacer()
            if index == 1 {
                Spacer().frame(width: 60)
            }
        }
    }
}

struct Tab: View {
    
    enum Constant {
       static let textIconAvto =  "avto1"
        static let textIconStats =  "stats"
        static let textIconMore =  "more"
        static let textIconExplor =  "explore"
    }
    
    @State var selection = 0
    
    var body: some View {
        CustomTabView(selection: $selection) {
            ContentView()
                .myTabItem {
                    TabItem(icont: Constant.textIconAvto)
                }
                .opacity(selection == 0 ? 1 : 0)
            ChargingView()
                .myTabItem {
                    TabItem( icont: Constant.textIconStats)
                }
                .opacity(selection == 1 ? 1 : 0)
            
            ProfileView()
                .myTabItem {
                    TabItem( icont: Constant.textIconMore)
                }
                .opacity(selection == 2 ? 1 : 0)
            
            DevelopmentView()
                .myTabItem {
                    TabItem( icont: Constant.textIconExplor)
                }
                .opacity(selection == 3 ? 1 : 0)
        }
    }
}


#Preview {
    Tab()
}
