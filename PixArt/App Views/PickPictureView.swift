//
//  PickPictureView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 22.06.2024.
//

import SwiftUI

struct PickPictureView: View {
    @Binding var currentScreen: Screen
    var categoryViewModel = CategoryViewModel()
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            ScrollView {
                VStack(spacing: 10) {
                    Text("Pick a Picture")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                        .padding(.leading, 30)
                    
                    ForEach(categoryViewModel.categories, id: \.self) { category in
                        CategoryView(currentScreen: $currentScreen, categoryName: category.name, categorySfSymbol: category.sfSymbolName)
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

