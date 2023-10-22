//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mideveloper on 22/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @StateObject var viewModel: WeatherViewModel = WeatherViewModel(
        webservice: WeatherService()
    )
    
    // MARK: - BODY
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
        } else
        {
            WeatherView(viewModel: viewModel)
        }
        
    }
}

#Preview {
    ContentView()
}
