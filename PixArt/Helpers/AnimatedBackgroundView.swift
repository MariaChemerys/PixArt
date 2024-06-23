//
//  AnimatedBackgroundView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import SwiftUI

struct AnimatedBackgroundView: View {
    
    @State private var animateGradient: Bool = false
    
    var body: some View {
        LinearGradient(colors: [Color.cyan, Color.lightQuilt], startPoint: .topLeading, endPoint: .bottomTrailing)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
            .ignoresSafeArea()
    }
}
