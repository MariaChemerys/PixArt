//
//  PictureModel.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI

struct Picture: Identifiable, Hashable{
    
    var id: UUID = UUID()
    var name: String
    var category: String
    
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Conform to Equatable
    static func == (lhs: Picture, rhs: Picture) -> Bool {
        lhs.id == rhs.id
    }
}

