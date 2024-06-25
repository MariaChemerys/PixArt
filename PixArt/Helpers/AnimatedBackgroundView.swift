//
//  AnimatedBackgroundView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI

struct AnimatedBackgroundView: View {
    
    @State private var animateGradient: Bool = false
    var firstColor: Color
    var secondColor: Color
    
    var body: some View {
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
