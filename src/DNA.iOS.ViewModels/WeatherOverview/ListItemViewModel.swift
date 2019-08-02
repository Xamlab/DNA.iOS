//
//  ListItemViewModel.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/27/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import DNA_iOS_Core

public struct ListItemViewModel: WeatherFormatable {
	public let hour: String
	public let weekDay: String
	public let temperature: String
	public let lowTemperature: String
	public let highTemperature: String
	public let description: Description?
	public let pod: Pod
	
	
	init(hour: String,
		 weekDay: String,
		 temperature: String,
		 lowTemperature: String,
		 highTemperature: String,
		 description: Description?,
		 pod: Pod) {
		
		self.hour = hour
		self.weekDay = weekDay
		self.temperature = temperature
		self.lowTemperature = lowTemperature
		self.highTemperature = highTemperature
		self.description = description
		self.pod = pod
	}
}
