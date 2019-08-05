//
//  LocationManager+CLLocationManagerDelegate.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import CoreLocation
import DNA_iOS_Core

extension LocationManager: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		guard let locationAuthorizationStatus = LocationAuthorizationStatus(rawValue: status.rawValue) else { return }
		
		self.locationAuthorizationStatus = locationAuthorizationStatus
		self.didAuthorizationStatus(locationAuthorizationStatus)
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

