//
//  ContentView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 25.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentScreen: Screen = .pickPicture
    @State var chosenPicture: Picture = Picture(name: "panda", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .green)
    
    var body: some View {
        
        switch currentScreen {
        case .pickPicture:
            PickPictureView(currentScreen: $currentScreen, chosenPicture: $chosenPicture)
        case .coloring:
            ColoringView(currentScreen: $currentScreen, chosenPicture: $chosenPicture)
        }
    }
}

#Preview {
    ContentView()
}
