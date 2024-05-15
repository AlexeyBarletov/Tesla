//
//  Extension + Gradient.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import Foundation
import SwiftUI

extension View {
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)
    }
}

