//
//  ColoringView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 25.06.2024.
//

import SwiftUI

struct ColoringView: View {
    
    @Binding var currentScreen: Screen
    
    var body: some View {
        Text("Hello")
    }
}

#Preview {
    PickPictureView(currentScreen: .constant(.coloring))
}
