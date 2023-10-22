//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mideveloper on 23/10/2023.
//

import SwiftUI

struct WeatherView: View {
    
    // MARK: - PROPERTIES
    @StateObject var viewModel: WeatherViewModel
    @State private var showingSheet = false
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .leading) {
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
            
            //: CONTENT
            
            VStack(alignment: .leading) {
                //: HEADER
                HStack {
                    
                    Button {
                        viewModel.locationManager.requestLocation()
                    } label: {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                    }
                    
                    Spacer()
                    
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "building.2.crop.circle.fill")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                    }
                    .sheet(isPresented: $showingSheet) {
                        CityLocationView(cityNameClosure: { cityName in
                            viewModel.getWeather(by: cityName)
                        }, isPresented: $showingSheet)
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.medium, .large])
                    }
                }//: HSTACK
                .tint(.black)
                
                Spacer()
                
                //: TEMP VIEW
                HStack {
                    Text("\(viewModel.temp)°")
                        .font(.system(size: 100,weight: .bold))
                    Text(WeatherHelper.getWeatherIcon(condition:viewModel.conditionId))
                        .font(.system(size: 100,weight: .regular))
                }
                
                Spacer()
                
                //: FOOTER
                Text("\(WeatherHelper.getMessage(temp: viewModel.temp)) in \(viewModel.name)")
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 60))
                
            } //: VStack
            .padding()
        }//: ZStack
    }
}

#Preview {
    WeatherView(viewModel: WeatherViewModel())
}
