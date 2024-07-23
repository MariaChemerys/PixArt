//
//  ColoringView.swift
//  PixArt
//
//  Created by Mariia Chemerys on 25.06.2024.
//


import SwiftUI

// The ColoringView struct represents the view for coloring a selected picture.
struct ColoringView: View {
    
    @Binding var currentScreen: Screen
    @Binding var chosenPicture: Picture
    
    @StateObject var coloringState = ColoringState()
    
    @State private var isScaled = false
    @State private var chosenColorNumber: Int = 0
    @State private var selectedRowIndex: Int?
    @State private var selectedColumnIndex: Int?
    @State private var selectedNumber: Int?
    
    // An array to store colors for each square in the grid.
    @State private var squareColors: [[Color]] = Array(repeating: Array(repeating: .softGray, count: 21), count: 20)
    
    var body: some View {
        
        // Read the lines from the file corresponding to the chosen picture.
        let numberedSquaresStrings = coloringState.readLinesFromFile(fileName: "\(chosenPicture.name) numbered grid")
        
        // Convert the lines to a 2D integer array representing the grid.
        let numberedSquaresIntegers = coloringState.squareNumbersLinesTo2DIntArray(lines: numberedSquaresStrings)
        
        // Get the unique numbers present in the grid which represent different colors.
        let numbersOfPresentColors = coloringState.getPresentColorsNumbers(squareNumbersInt2DArray: numberedSquaresIntegers)
        
        // Get the dimensions of the board.
        let boardWidth = coloringState.getBoardWidth(arrayOfNumberedSquaresStrings: numberedSquaresStrings)
        let boardHeight = coloringState.getBoardHeight(arrayOfNumberedSquaresStrings: numberedSquaresStrings)
        
        ZStack {
            // Animated background view with the dominant colors of the chosen picture.
            AnimatedBackgroundView(firstColor: chosenPicture.firstDominantColor, secondColor: chosenPicture.secondDominantColor)
            
            VStack {
                // Back button to navigate to the previous screen.
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.currentScreen = .pickPicture
                        }
                        softHaptic()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                Spacer()
                
                // Grid view to display the numbered squares and color them
                VStack(spacing: 1) {
                    ForEach(0..<boardHeight) { rowIndex in
                        HStack(spacing: 1) {
                            ForEach(0..<boardWidth) { columnIndex in
                                Text("\(numberedSquaresIntegers[rowIndex][columnIndex])")
                                    .frame(width: 17, height: 22)
                                    .foregroundColor(
                                        squareColors[rowIndex][columnIndex] == .softGray ? .white : squareColors[rowIndex][columnIndex]
                                    )
                                    .font(.system(size: 14))
                                    .background(
                                        Rectangle()
                                            .foregroundColor(squareColors[rowIndex][columnIndex])
                                    )
                                    .onTapGesture {
                                        // Handle tap gesture to color the square.
                                        selectedRowIndex = rowIndex
                                        selectedColumnIndex = columnIndex
                                        selectedNumber = numberedSquaresIntegers[rowIndex][columnIndex]
                                        if (selectedRowIndex == rowIndex && selectedColumnIndex == columnIndex) && chosenColorNumber == selectedNumber {
                                            let newColor = Color(coloringState.getColor(squareNumber: selectedNumber!))
                                            squareColors[rowIndex][columnIndex] = newColor
                                        }
                                    }
                            }
                        }
                    }
                }
                
                Spacer()
                
                // Color Picker
                ScrollView(.horizontal) {
                    HStack(spacing: 33.0) {
                        ForEach(numbersOfPresentColors, id: \.self) { number in
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
                                        chosenColorNumber = number
                                        softHaptic()
                                    }
                                    .scaleEffect(chosenColorNumber == number ? 1.5 : 1.2)
                            }
                        }
                    }
                    .padding(25)
                }
                .background(.thinMaterial)
                
            }
        }
    }
}


#Preview {
    ColoringView(currentScreen: .constant(.coloring), chosenPicture: .constant(Picture(name: "panda", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .green)))
}
