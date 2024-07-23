//
//  AnimatedBackgroundView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI

// The AnimatedBackgroundView struct represents a view with an animated gradient background.
struct AnimatedBackgroundView: View {
    
    // State variable to manage the animation state of the gradient.
    @State private var animateGradient: Bool = false
    
    // Variables to store the first and second colors of the gradient.
    var firstColor: Color
    var secondColor: Color
    
    var body: some View {
        // Linear gradient starting from the top leading to the bottom trailing.
        LinearGradient(colors: [firstColor, secondColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
            .ignoresSafeArea()
    }
}
