//
//  List.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class List: Codable {
	public let dtTxt: String
    public let dt: Int
    public let main: MainClass
    public let clouds: Clouds
    public let wind: Wind
    public let snow: Snow
    public let sys: Sys
	public let weather: [Weather]
	
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, snow, sys
        case dtTxt = "dt_txt"
    }
}
