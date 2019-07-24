//
//  LocationManager.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import CoreLocation

internal class LocationManager: NSObject, ILoctionManager {
    private let clLocationManager = CLLocationManager()
    private var didAuthorizationStatus: AuthorizationStatusHandler = { _ in }
    private var didUpdatedCurrentCity: CityHandler = { _ in }
    var clAuthorizationStatus = CLAuthorizationStatus.notDetermined
    var currentCity: City? = nil
    
    
    func requestAuthorization(_ requestType: RequestType = .always, _ startUpdatingLocation: Bool = true) {
        requestType == .always
            ? self.clLocationManager.requestAlwaysAuthorization()
            : self.clLocationManager.requestWhenInUseAuthorization()
        
        guard CLLocationManager.locationServicesEnabled() else { return }
        
        self.clLocationManager.delegate = self
        self.clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        guard startUpdatingLocation else { return }
        
        self.startUpdatingLocation()
    }
    
    func startUpdatingLocation() {
        self.clLocationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.clLocationManager.stopUpdatingLocation()
    }

    func setAuthorizationStatusUpdatedHandler(_ handler: @escaping AuthorizationStatusHandler) {
        self.didAuthorizationStatus = handler
    }
    func setCurrentCityUpdatedHandler(_ handler: @escaping CityHandler) {
        self.didUpdatedCurrentCity = handler
    }
}


// MARK: - CLLocationManagerDelegate -

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.clAuthorizationStatus = status
        self.didAuthorizationStatus(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.updateCurrentCityIfNeeded(locations.first)
    }
    
    private func updateCurrentCityIfNeeded(_ location: CLLocation?) {
        guard let location = location else { return }
        
        location.getCity()
            .then { [unowned self] (cityOptional)  in
                guard let city = cityOptional else { return }
                
                self.currentCity = city
                self.didUpdatedCurrentCity(city)
        }
    }
}

