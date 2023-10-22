//
//  GradientButton.swift
//  WeatherApp
//
//  Created by Mideveloper on 23/10/2023.
//

import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statemetn with Nil Coalescing
                // Condition ? A : B
                // A: When User pressed the Button
                // B: When the Button is not pressed
                configuration.isPressed ?
                LinearGradient(
                    colors: [
                        .black,
                        .cyan,
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                :
                LinearGradient(
                        colors: [
                            .black,
                            .cyan,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
            )
            .clipShape(.capsule)
    }
}
