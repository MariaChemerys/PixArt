//
//  CategoryView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI


struct CategoryView: View {
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var pictureViewModel = PictureViewModel()
    
    var body: some View {
        LazyVGrid(columns: adaptiveColumns, spacing: 10) {
            ForEach(pictureViewModel.pictures, id: \.self) { picture in
                Button(action: {
                    // Your action here
                }) {
                    Image("\(picture.name)")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
}

#Preview {
    CategoryView()
}
