//
//  ColoringView Logic.swift
//  PixArt
//
//  Created by Mariia Chemerys on 26.06.2024.
//

import Foundation
import SwiftUI

// ObservableObject class to manage the state of the coloring process
class ColoringState: ObservableObject {
    
    // Function to read lines from a specified text file
    func readLinesFromFile(fileName: String) -> [String] {
        let errorArray: [String] = Array(repeating: "error", count: 1)
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "txt") {
            do {
                // Read the contents of the file into a string
                let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
                
                // Split the string into an array of lines
                let trimmedInput = fileContents.trimmingCharacters(in: .whitespacesAndNewlines)
                let lines = trimmedInput.components(separatedBy: "\n")
                
                return lines
            } catch {
                // Handle error if file reading fails
                print("Error reading file: \(error)")
                return errorArray
            }
        } else {
            // Handle case where the file is not found
            print("File not found")
        }
        return errorArray
    }
    
    // Function to convert lines with square numbers to a 2D integer array
    func squareNumbersLinesTo2DIntArray(lines: [String]) -> [[Int]] {
        // Get the dimensions of the board
        let boardHeight = getBoardHeight(arrayOfNumberedSquaresStrings: lines)
        let boardWidth = getBoardWidth(arrayOfNumberedSquaresStrings: lines)
        
        // Initialize a 2D array of strings
        var str2DArray = Array(repeating: Array(repeating: "", count: boardWidth), count: boardHeight)
        var i = 0
        for currentLine in lines {
            var currentLineSeparated = currentLine.components(separatedBy: ",")
            currentLineSeparated.removeLast()
            str2DArray[i] = currentLineSeparated
            i += 1
        }
        
        // Convert the 2D string array to a 2D int array
        let intArray: [[Int]] = str2DArray.map { row in
            row.map { element in
                // Convert each element to an integer
                if let intValue = Int(element) {
                    return intValue
                } else {
                    // Handle cases where conversion fails (e.g., non-integer strings)
                    return 100 // Default value
                }
            }
        }
        
        return intArray
    }
    
    // Function to get the board height from an array of numbered square strings
    func getBoardHeight(arrayOfNumberedSquaresStrings: [String]) -> Int {
        let boardHeight = arrayOfNumberedSquaresStrings.count
        return boardHeight
    }
    
    // Function to get the board width from an array of numbered square strings
    func getBoardWidth(arrayOfNumberedSquaresStrings: [String]) -> Int {
        let squareNumbersInAString = arrayOfNumberedSquaresStrings[0].components(separatedBy: ",")
        let boardWidth = squareNumbersInAString.count - 1
        return boardWidth
    }
    
    // Function to get the numbers present in a 2D array of integers
    func getPresentColorsNumbers(squareNumbersInt2DArray: [[Int]]) -> [Int] {
        let flattenedSet = Set(squareNumbersInt2DArray.flatMap { $0 })
        
        // Convert the set back to an array and sort it
        let uniqueNumbers = Array(flattenedSet)
        let sortedUniqueNumbers = uniqueNumbers.sorted()
        return sortedUniqueNumbers
    }
    
    // Function to get the color associated with a specific square number
    func getColor(squareNumber: Int) -> Color {
        switch squareNumber {
        case 0:
            return .white
        case 1:
            return .gray
        case 2:
            return .black
        case 3:
            return .green
        case 4:
            return .apricot
        case 5:
            return .blue
        case 6:
            return .darkBlue
        case 7:
            return .lightBlue
        case 8:
            return .orange
        case 9:
            return .silver
        case 10:
            return .lightOrange
        case 11:
            return .dullGray
        case 12:
            return .yellow
        case 13:
            return .lightYellow
        case 14:
            return .lightRed
        case 15:
            return .red
        case 16:
            return .brown
        case 17:
            return .lightBrown
        case 18:
            return .darkBrown
        case 19:
            return .darkGreen
        case 20:
            return .lightGreen
        case 21:
            return .darkPink
        case 22:
            return .purple
        case 23:
            return .darkRed
        default:
            return Color.cyan
        }
    }
}

