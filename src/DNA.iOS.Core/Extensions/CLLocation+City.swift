//
//  CLLocation+City.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import CoreLocation
import Promises

typealias CityOptional = City?

extension CLLocation {
    func getCity() -> Promise<CityOptional> {
        let promise = Promise<CityOptional> { fulfill, reject in
            CLGeocoder().reverseGeocodeLocation(self) { (placemarks, error) in
                guard let placemark = placemarks?.first,
                    let cityName = placemark.locality,
                    let location = placemark.location else { fulfill(nil); return }
				
                let city: CityOptional = City.init(name: cityName, location: location)
                fulfill(city)
            }
        }
        return promise
    }
}
