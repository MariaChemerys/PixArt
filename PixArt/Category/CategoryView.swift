//
//  CategoryView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI

struct CategoryView: View {
    
    var categoryName: String
    var categorySfSymbol: String
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 95), spacing: 5)
    ]
    
    var pictureViewModel = PictureViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: categorySfSymbol)
                    .font(.largeTitle)
                
                Text(categoryName)
                    .font(.title)
                    .fontWeight(.semibold)
                    
            }
            .frame(maxWidth: 300, alignment: .leading)
            .padding()
            
            let categoryPictures = pictureViewModel.pictures.filter { $0.category == categoryName }
            
            if !categoryPictures.isEmpty {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(categoryPictures, id: \.self) { picture in
                        Button(action: {
                            // Your action here
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
    PickPictureView()
}
