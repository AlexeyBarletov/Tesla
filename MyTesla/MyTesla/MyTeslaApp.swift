//
//  MyTeslaApp.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 14.05.2024.
//

import SwiftUI

@main
struct MyTeslaApp: App {
    var body: some Scene {
        WindowGroup {
            UnlockView()
                .environment(\.colorScheme, .dark)

        }
    }
}
