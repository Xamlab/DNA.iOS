//
//  City.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import CoreLocation

public struct City {
    let name: String
    let location: CLLocation
}


// MARK: - Equatable -

extension City: Equatable {
    public static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
}
