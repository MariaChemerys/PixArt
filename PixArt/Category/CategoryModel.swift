//
//  CategoryModel.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI

// Category of Pictures
struct Category: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var sfSymbolName: String
    
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Conform to Equatable
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
}
