//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mideveloper on 22/10/2023.
//

import Foundation
import SwiftUI
import Combine
import CoreLocation

class WeatherViewModel: ObservableObject {
    
    // MARK: - PROPERTIES
    private var webservice: WeatherServiceProtocol!
    @Published var weatherData: WeatherResponse?
    @ObservedObject var locationManager: LocationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()
    @Published var isLoading = true
    
    // MARK: - INITIALIZER
    init(webservice: WeatherServiceProtocol = WeatherService()) {
        self.webservice = webservice
        obserLocationChanges()
    }
    
    // MARK: - Location Chagne Observer
    func obserLocationChanges() {
        // Observe changes to userLocation
        locationManager.$userLocation
            .sink { [weak self] location in
                self?.getCurrentLocationWeather(location)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - GETTERS
    var temp: Int {
        Int(weatherData?.main.temp ?? 0.0)
    }
    
    var name: String {
        "\(weatherData?.name ?? "")"
    }
    
    var conditionId: Int {
        weatherData?.weather.first?.id ?? 0
    }
}

//MARK: - API CALLS
extension WeatherViewModel {
    /// Get Current Location based weather
    func getCurrentLocationWeather(_ location: CLLocation?) {
        guard let userLocation = location else  {return}
        self.isLoading = true
        let latitude = String(userLocation.coordinate.latitude)
        let longitude = String(userLocation.coordinate.longitude)
        
        webservice.getWeather(latitude, longitude) { [weak self] response, error in
            guard let response = response, let self = self else {
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.weatherData = nil
                }
                return
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.weatherData = response
            }
        }
    }
    
    /// Get weather by City Name
    func getWeather(by cityName: String) {
        self.isLoading = true
        webservice.getCityWeather(cityName) { [weak self] response, error in
            guard let response = response, let self = self else {
                DispatchQueue.main.async {
                    self?.isLoading = false
                    self?.weatherData = nil
                }
                return
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.weatherData = response
            }
        }
    }
}
