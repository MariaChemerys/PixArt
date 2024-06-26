//
//  PictureViewModel.swift
//  PixArt
//
//  Created by Mariia Chemerys on 23.06.2024.
//

import Foundation

class PictureViewModel {
    var pictures = [
        Picture(name: "boat", category: "Transport", firstDominantColor: .cyan, secondDominantColor: .rosa),
        Picture(name: "rocket", category: "Transport", firstDominantColor: .blue, secondDominantColor: .rosa),
        Picture(name: "UFO", category: "Transport", firstDominantColor: .rosa, secondDominantColor: .purple),
        Picture(name: "penguin", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .lightOrange),
        Picture(name: "panda", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .green),
        Picture(name: "tyrannosaurus", category: "Animals", firstDominantColor: .green, secondDominantColor: .rosa),
        Picture(name: "hedgehog", category: "Animals", firstDominantColor: .lightQuilt, secondDominantColor: .green),
        Picture(name: "parrot", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .pineapple),
        Picture(name: "beaver", category: "Animals", firstDominantColor: .cyan, secondDominantColor: .lightBrown),
        Picture(name: "volcano", category: "Nature", firstDominantColor: .cyan, secondDominantColor: .rosa),
        Picture(name: "solar system", category: "Nature", firstDominantColor: .cyan, secondDominantColor: .pineapple),
        Picture(name: "raspberry", category: "Nature", firstDominantColor: .rosa, secondDominantColor: .green),
    ]
}
