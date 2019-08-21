//
//  LoadWeatherOverviewCommand+WeatherFormatable.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import DNA_iOS_Core

extension LoadWeatherOverviewCommand: WeatherFormatable {
	func convertedWeatherItemViewModel(_ weatherOverView: WeatherOverview) -> WeatherItemViewModel {
		
		let cityAndDescriptionPair = (weatherOverView.city.name, weatherOverView.list.first?.weather.first?.description.rawValue.capitalized ?? "--")
		
		let tempMin = weatherOverView.list.first?.main.tempMin
		let lowTemperature = (tempMin != nil ? "\(self.getCelsius(kelvin: tempMin!))" : "-")
		
		let tempMax = weatherOverView.list.first?.main.tempMax
		let highTemperature = (tempMin != nil ? "\(self.getCelsius(kelvin: tempMax!))" : "-")
		
		let dtTxt = weatherOverView.list.first?.dtTxt ?? ""
		let weekDay = "\(self.getWeekDay(dateString: dtTxt)) Today"
		
		
		let temp = weatherOverView.list.first?.main.temp
		let temperature = (tempMin != nil ? "\(self.getCelsius(kelvin: temp!))°" : "-")
		
		let listItemViewModelsOnly12 = weatherOverView.list[0..<12].map({ self.convertedListItemViewModel($0) })
		let listItemViewModels = weatherOverView.list.map({ self.convertedListItemViewModel($0) })
		var listItemViewModelsForWeekDays = [ListItemViewModel]()
		
		for item in listItemViewModels {
			if !listItemViewModelsForWeekDays.contains(where: { $0.weekDay == item.weekDay}) {
				listItemViewModelsForWeekDays.append(item)
			}
		}
		
		let description = self.getTodayCurrentDescriptionResult(weatherOverView.list.first?.weather ?? [])
		let todayDescrption = "Today: \(description.rawValue.capitalized). The high will be \(highTemperature)°. \nTonight with a low of \(lowTemperature)°"
		
		let extendedInfo = self.getInfo(weatherOverView)
		
		
		return WeatherItemViewModel(cityAndDescriptionPair: cityAndDescriptionPair,
									lowTemperature: lowTemperature,
									highTemperature: highTemperature,
									weekDay: weekDay,
									temperature: temperature,
									listItemViewModelsOnly12: listItemViewModelsOnly12,
									listItemViewModels: listItemViewModels,
									listItemViewModelsForWeekDays: listItemViewModelsForWeekDays,
									todayDescription: todayDescrption,
									extendedInfo: extendedInfo)
	}
	
	func convertedListItemViewModel(_ list: List) -> ListItemViewModel {
		let hour = self.getHour(dateString: list.dtTxt)
		let weekDay = self.getWeekDay(dateString: list.dtTxt)
		let temperature = self.getTemperature(temp: list.main.temp)
		let lowTemperature = self.getCelsius(kelvin: list.main.tempMin)
		let highTemperature = self.getCelsius(kelvin: list.main.tempMax)
		let description = list.weather.first?.description
		let pod = list.sys.pod
		
		return ListItemViewModel(hour: hour,
								 weekDay: weekDay,
								 temperature: temperature,
								 lowTemperature: lowTemperature,
								 highTemperature: highTemperature,
								 description: description,
								 pod: pod)
	}
	
	private func getInfo(_ weatherOverview: WeatherOverview) -> [(ExtendedInfo, String)] {
		var info = [(ExtendedInfo, String)]()
		for extendedInfoKey in ExtendedInfo.allCases {
			let tuple = (extendedInfoKey, self.setupString(extendedInfoKey, weatherOverview))
			info.append(tuple)
		}
		return info
	}
	
	private func setupString(_ key: ExtendedInfo, _ weatherOverview: WeatherOverview) -> String {
		guard let list = weatherOverview.list.first else { return ""}
		
		switch key {
		case .sunrise:
			return "6:18"
		case .sunset:
			return "21:13"
		case .chanceOfRain:
			return "0%"
		case .humidity:
			return self.floatToPercentageString(float: Float(list.main.humidity))
		case .wind:
			return "s 3km/hr"
		case .feelLike:
			return addDegreeSign(toNumber: "\(list.main.temp)")
		case .precipitation:
			return "0 cm"
		case .pressure:
			return addUnit(ExtendedInfoUnits.pressure.rawValue, toNumber: list.main.pressure)
		case .visibility:
			return "14.5 km"
		case .uvIndex:
			return "4"
		}
	}
}


// MARK: - ExtendedInfoUnits Enum -

fileprivate enum ExtendedInfoUnits: String {
	case windSpeed = "km/hr"
	case precipitation = "cm"
	case pressure = "hPa"
	case visibility = "km"
}
