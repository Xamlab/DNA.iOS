//
//  CityRepository.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit
import DNA_iOS_Core

internal class CityRepository: ICityRespository {
    private enum Keys: String { case Cities }
    let cities: [WeatherCity]
    
    
    init() {
        guard let asset = NSDataAsset(name: Keys.Cities.rawValue),
            let cities = try? JSONDecoder().decode([WeatherCity].self, from: asset.data) else { self.cities = []; return }
        
        self.cities = cities
    }
}
