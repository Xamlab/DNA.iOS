//
//  WeatherItemViewModel.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import DNA_iOS_Core
import UIKit

public class WeatherItemViewModel: WeatherFormatable {
   // private var weatherOverView: WeatherOverview
	
	public var cityAndDescriptionPair: (city: String, description: String)
	public var lowTemperature: String
	public var highTemperature: String
	public var weekDay: String
	public var temperature: String
	public var listItemViewModelsOnly12: [ListItemViewModel]
	public var listItemViewModels: [ListItemViewModel]
	public var listItemViewModelsForWeekDays: [ListItemViewModel]
	public var todayDescription: String
	public var extendedInfo: [(ExtendedInfo, String)]
	
	
	init(cityAndDescriptionPair: (city: String, description: String),
		 lowTemperature: String,
		 highTemperature: String,
		 weekDay: String,
		 temperature: String,
		 listItemViewModelsOnly12: [ListItemViewModel],
		 listItemViewModels: [ListItemViewModel],
		 listItemViewModelsForWeekDays: [ListItemViewModel],
		 todayDescription: String,
		 extendedInfo: [(ExtendedInfo, String)]) {
		
		self.cityAndDescriptionPair = cityAndDescriptionPair
		self.lowTemperature = lowTemperature
		self.highTemperature = highTemperature
		self.weekDay = weekDay
		self.temperature = temperature
		self.listItemViewModelsOnly12 = listItemViewModelsOnly12
		self.listItemViewModels = listItemViewModels
		self.listItemViewModelsForWeekDays = listItemViewModelsForWeekDays
		self.todayDescription = todayDescription
		self.extendedInfo = extendedInfo
	}
}
