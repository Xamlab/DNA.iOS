//
//  MainClass.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class MainClass: Codable {
    public let temp: Double
    public let tempMin: Double
    public let tempMax: Double
    public let pressure: Double
    public let seaLevel: Double
    public let grndLevel: Double
    public let humidity: Int
    public let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}
