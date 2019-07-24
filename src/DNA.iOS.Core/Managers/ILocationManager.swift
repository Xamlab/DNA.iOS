//
//  ILocationManager.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import CoreLocation

public enum RequestType { case always, whenInUse }
public typealias AuthorizationStatusHandler = (CLAuthorizationStatus) -> Void
public typealias CityHandler = (City) -> Void

public protocol ILoctionManager {
    var clAuthorizationStatus: CLAuthorizationStatus { get }
    var currentCity: City? { get }

    func requestAuthorization(_ requestType: RequestType, _ startUpdatingLocation: Bool)
    func startUpdatingLocation()
    func stopUpdatingLocation()
    func setAuthorizationStatusUpdatedHandler(_ handler: @escaping AuthorizationStatusHandler)
    func setCurrentCityUpdatedHandler(_ handler: @escaping CityHandler)
}