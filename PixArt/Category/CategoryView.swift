//
//  CategoryView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI

struct CategoryView: View {
    
    @Binding var currentScreen: Screen
    @Binding var chosenPicture: Picture
    
    var category: Category
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 95), spacing: 5)
    ]
    
    var pictureViewModel = PictureViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: category.sfSymbolName)
                    .font(.largeTitle)
                
                Text(category.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    
            }
            .frame(maxWidth: 300, alignment: .leading)
            .padding(10)
            
            let categoryPictures = pictureViewModel.pictures.filter { $0.category == category.name }
            
            if !categoryPictures.isEmpty {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(categoryPictures, id: \.self) { picture in
                        Button(action: {
                            withAnimation(.easeInOut(duration: 1.0)){
                                self.currentScreen = .coloring
                                self.chosenPicture = picture
                            }
                            
                        }) {
                            Image("\(picture.name)")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 11)
                .frame(width: 350)
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
