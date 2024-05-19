//
//  ProfilView.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 19.05.2024.
//

import Foundation
import SwiftUI

 ///Структура отображает старницу которая в разработке
struct ProfileView: View {
    
    enum Constant {
       static let textPage = "Страница находиться в разработке"
        static let imageSystemName = "exclamationmark.triangle"
    }
    var body: some View {
        backgroundStackView {
            VStack {
                Text(Constant.textPage)
                          .font(.verdana(size: 15))
                          .foregroundStyle(.gray)
                Image(systemName: Constant.imageSystemName)
                }
            }
        }
      
    }
