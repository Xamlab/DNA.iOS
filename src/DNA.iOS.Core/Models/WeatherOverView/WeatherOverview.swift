//
//  WeatherOverview.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class WeatherOverview: Codable {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [List]
    let city: WeatherCity
}
