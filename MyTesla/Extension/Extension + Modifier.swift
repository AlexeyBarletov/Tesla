//
//  File.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 19.05.2024.
//

import Foundation
import SwiftUI

/// Расширения для модификаторов в SwiftUI для стилизации вида в неявных стилях неоморфизма.
extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
    
    func neumorphismUnSelectedStyleStroke() -> some View {
        modifier(NeumorphismUnSelectedStyleStroke())
    }
}

