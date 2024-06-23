//
//  PickPictureView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 22.06.2024.
//

import SwiftUI

struct PickPictureView: View {
    
    var categoryViewModel = CategoryViewModel()
    
    var body: some View {
        ZStack {
            AnimatedBackgroundView()
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Pick a Picture")
                        .font(.largeTitle)
                        .bold()
                    
                    ForEach(categoryViewModel.categories, id: \.self) { category in
                        CategoryView(categoryName: category.name)
                    }
                }
//                .padding(.vertical, 80)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PickPictureView()
}

