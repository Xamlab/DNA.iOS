//
//  City.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class City {
    let name: String
    let latitude: Double
	let longitude: Double

	
	public init(name: String,
				latitude: Double,
				longitude: Double) {
		self.name = name
		self.latitude = latitude
		self.longitude = longitude
	}
}
