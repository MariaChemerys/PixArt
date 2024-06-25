//
//  ContentView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 25.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentScreen: Screen = .pickPicture
    
    var body: some View {
        
        switch currentScreen {
        case .pickPicture:
            PickPictureView(currentScreen: $currentScreen)
        case .coloring:
            ColoringView(currentScreen: $currentScreen)
        }
    }
}

#Preview {
    ContentView()
}
