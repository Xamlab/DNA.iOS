//
//  WeatherOverview.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class WeatherOverview: Codable {
    public let cod: String
    public let message: Double
    public let cnt: Int
    public let list: [List]
    public let city: WeatherCity
}
