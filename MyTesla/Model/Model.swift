//
//  Model.swift
//  MyTesla
//
//  Created by Алексей Барлетов on 19.05.2024.
//

import Foundation

/// Структура  представляющая элемент вкладки, соответствующий протоколам 
struct TabItem: Identifiable, Equatable {
    /// Уникальный идентификатор элемента вкладки.
    var id = UUID()
    /// Строка, представляющая иконку элемента вкладки.
    var icont: String
}
