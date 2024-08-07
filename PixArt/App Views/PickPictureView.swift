//
//  PickPictureView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 22.06.2024.
//

import SwiftUI

struct PickPictureView: View {
    @Binding var currentScreen: Screen
    @Binding var chosenPicture: Picture
    
    // View model variable to manage categories of pictures
    var categoryViewModel = CategoryViewModel()
    
    var body: some View {
        ZStack {
            // Background with an animated gradient
            AnimatedBackgroundView(firstColor: .cyan, secondColor: .lightQuilt)
            
            ScrollView {
                VStack(spacing: 10) {
                    Text("Pick a Picture")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                        .padding(.leading, 30)
                    
                    // Loop through categories and display each
                    ForEach(categoryViewModel.categories, id: \.self) { category in
                        CategoryView(currentScreen: $currentScreen, chosenPicture: $chosenPicture, category: category)
                    }
                }
                .padding(.top, 30)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
