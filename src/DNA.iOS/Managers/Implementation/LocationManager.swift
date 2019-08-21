//
//  LocationManager.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import CoreLocation
import DNA_iOS_Core

internal class LocationManager: NSObject, ILoctionManager {
    private let clLocationManager = CLLocationManager()
	var didAuthorizationStatus: AuthorizationStatusHandler = { _ in }
	var didUpdatedCurrentCity: CityHandler = { _ in }
    var locationAuthorizationStatus = LocationAuthorizationStatus.notDetermined
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
