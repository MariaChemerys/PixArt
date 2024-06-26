//
//  Haptic Feedback.swift
//  PixArt
//
//  Created by Mariia Chemerys on 26.06.2024.
//

import SwiftUI
import CoreHaptics

// Function to run soft haptic effect
func softHaptic() {
    let softHaptic = UIImpactFeedbackGenerator(style: .soft)
    softHaptic.impactOccurred()
}
