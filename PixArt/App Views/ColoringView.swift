//
//  ColoringView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 25.06.2024.
//

import SwiftUI

struct ColoringView: View {
    
    @Binding var currentScreen: Screen
    @Binding var chosenPicture: Picture
    
    @StateObject var coloringState = ColoringState()
    @State private var isScaled = false
    @State private var scaledButtonIndex: Int? = 0
    @State private var chosenColorNumber: Int = 0
    @State private var selectedRowIndex: Int?
    @State private var selectedColumnIndex: Int?
    @State private var selectedNumber: Int?
    
    // Introduce a state variable to store colors for each rectangle
    @State private var squareColors: [[Color]] = Array(repeating: Array(repeating: .softGray, count: 21), count: 20)
    
    var body: some View {
        
        let numberedSquaresStrings = coloringState.readLinesFromFile(fileName: "\(chosenPicture.name) numbered grid")
        
        let boardWidth = coloringState.getBoardWidth(arrayOfNumberedSquaresStrings: numberedSquaresStrings)
        
        let boardHeight = coloringState.getBoardHeight(arrayOfNumberedSquaresStrings: numberedSquaresStrings)
        
        let numberedSquaresIntegers = coloringState.linesWithSquareNumbersToTwoDimensionalIntArray(lines: numberedSquaresStrings)
        
        let numbersOfPresentColors = coloringState.getPresentColorsNumbers(squareNumbersInt2DArray: numberedSquaresIntegers)
        
        ZStack {
            AnimatedBackgroundView(firstColor: chosenPicture.firstDominantColor, secondColor: chosenPicture.secondDominantColor)
            
            VStack {
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)){
                        self.currentScreen = .pickPicture
                    }
                })
                {
                    Image(systemName: "arrow.left")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                Text(chosenPicture.name)
                
                Spacer()
                
                // Color Picker
                ScrollView(.horizontal) {
                    HStack(spacing: 33.0){
                        ForEach(numbersOfPresentColors, id:\.self){
                            number in
                            Button(action: {
                                withAnimation {
                                    self.isScaled.toggle()
                                }
                            }) {
                                Text("\(number)")
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(number == 0 ? Color.black : Color.white)
                                    .background(coloringState.getColor(squareNumber: number))
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        scaledButtonIndex = number
                                        chosenColorNumber = number
                                    }
                                    .scaleEffect(scaledButtonIndex == number ? 1.4 : 1.2)
                                    
                            }
                            .contentShape(Circle())
                            .accessibility(addTraits: .isButton)
                        }
                    }
                    .padding(20)
                  
                }
              
                .background(.thinMaterial)
                
                
            }
        }
    }
}


#Preview {
    ColoringView(currentScreen: .constant(.coloring), chosenPicture: .constant(Picture(name: "panda", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .green)))
}
