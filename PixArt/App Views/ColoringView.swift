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
        
        VStack {
            Button(action: {
                withAnimation(.easeInOut(duration: 1.0)){
                    self.currentScreen = .pickPicture
                }
            })
            {
                Image(systemName: "arrow.left")
                    .font(.largeTitle)
            }
            Text("Hello")
        }
    }
}

#Preview {
    ColoringView(currentScreen: .constant(.coloring))
}
