//
//  ContentView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 22.06.2024.
//

import SwiftUI

struct PickPictureView: View {
    
    @State private var animateGradient: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            LinearGradient(colors: [Color.cyan, Color.lightQuilt], startPoint: .topLeading, endPoint: .bottomTrailing)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear{
                    withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)){
                        animateGradient.toggle()
                    }
                }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    PickPictureView()
}
