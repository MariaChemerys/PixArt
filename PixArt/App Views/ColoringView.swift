//
//  ColoringView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 25.06.2024.
//

import SwiftUI

struct ColoringView: View {
    
    @Binding var currentScreen: Screen
    @Binding var chosenPicture: Picture
    
    var body: some View {
        
        ZStack {
            AnimatedBackgroundView(firstColor: chosenPicture.firstDominantColor, secondColor: chosenPicture.secondDominantColor)
            
            VStack {
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)){
                        self.currentScreen = .pickPicture
                    }
                })
                {
                    Image(systemName: "arrow.left")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                Text(chosenPicture.name)
            }
        }
    }
}

#Preview {
    ColoringView(currentScreen: .constant(.coloring), chosenPicture: .constant(Picture(name: "panda", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .green)))
}
