//
//  TabBarView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 18.05.2024.
//

import Foundation
import SwiftUI

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


struct TabItemPreferenseKey: PreferenceKey {
    static var defaultValue: [TabItem] = []
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}

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

struct TabItem: Identifiable, Equatable {
    var id = UUID()
    var icont: String
}

struct CustomTabView<Content: View>: View {
    @Binding var selection: Int
    @Namespace private var tabBarItem
    
    @State  private var  tabs: [TabItem] = [
        .init( icont: "avto1"),
        .init( icont: "stats"),
        .init( icont: "more"), 
        .init(icont: "explore")
    ]
    
    private var content: Content
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            ZStack {
                CustomTabBar()
                    .fill(.black)
                HStack {
                        tabsView
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .padding(.vertical, 5)
            .cornerRadius(10)
            .shadow(radius: 8)
            .padding()
         
        }
        .onPreferenceChange(TabItemPreferenseKey.self) { value in
            self.tabs = value
        }
    }
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _selection = selection
    }
    
    private var tabsView: some View {
        ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
            Spacer()
            VStack(spacing: 5) {
                Image(element.icont)
            }
                    .foregroundStyle(selection == index ? .blue : .gray)
                    .background(
                        ZStack {
                            if selection == index {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.yellow.opacity(0.4))
                                    .frame(width: 70, height: 50)
                                    .matchedGeometryEffect(id: "tabBarItem", in: tabBarItem)
                            }
                        }
                        )
                        .onTapGesture {
                            withAnimation {
                                selection = index
                            }
                        }
                    Spacer()
                }
        }
    }

struct  Tab: View {
    @State var selection = 0
    var body: some View {
        CustomTabView(selection: $selection) {
            ContentView()
                .myTabItem {
                    TabItem(icont: "avto1")
                }
                .opacity(selection == 0 ? 1 : 0)
            ChargingView()
                .myTabItem {
                    TabItem( icont: "stats")
                }
                .opacity(selection == 1 ? 1 : 0)

            Color.white
                .myTabItem {
                    TabItem( icont: "explore")
                }
                .opacity(selection == 2 ? 1 : 0)
            
            Color.white
                .myTabItem {
                    TabItem( icont: "more")
                }
                .opacity(selection == 2 ? 1 : 0)
        }
        
    }
}


#Preview {
    Tab()
}
