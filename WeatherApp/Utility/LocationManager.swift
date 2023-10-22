//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Mideveloper on 22/10/2023.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    var userLocation: CLLocation? { get set }
}

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerProtocol, ObservableObject {
    private var locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocation?
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // Request permission to use location services
        locationManager.startUpdatingLocation() // Start receiving location updates
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func requestLocation() {
        // Use this method to request a one-time location update
        locationManager.requestLocation()
    }
}


