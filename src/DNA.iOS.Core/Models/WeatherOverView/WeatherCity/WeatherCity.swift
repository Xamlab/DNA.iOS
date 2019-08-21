//
//  WeatherCity.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class WeatherCity: Codable {
    public let id: Int
    public let name: String
    public let country: String
    public let coord: Coord
}
