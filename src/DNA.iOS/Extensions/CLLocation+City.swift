//
//  CLLocation+City.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import CoreLocation
import Promises
import DNA_iOS_Core

typealias CityOptional = City?

extension CLLocation {
    func getCity() -> Promise<CityOptional> {
        let promise = Promise<CityOptional> { fulfill, reject in
            CLGeocoder().reverseGeocodeLocation(self) { (placemarks, error) in
                guard let placemark = placemarks?.first,
                    let cityName = placemark.locality,
                    let location = placemark.location else { fulfill(nil); return }
				
                let city: CityOptional = City(name: cityName,
											  latitude: location.coordinate.latitude,
											  longitude: location.coordinate.longitude)
                fulfill(city)
            }
        }
        return promise
    }
}
