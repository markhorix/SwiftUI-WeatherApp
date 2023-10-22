//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Mideveloper on 23/10/2023.
//

import SwiftUI

struct LoadingView: View {
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // : Background View
            LinearGradient(
                colors: [
                    .customWindyPuple,
                    .customWindyCyan
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            
            VStack(spacing: 20) {
                ProgressView()
                    .tint(Color.indigo)
                Text("Loading data...")
            }//: VStack
        }//: Zstack
    }
}

#Preview {
    LoadingView()
}
