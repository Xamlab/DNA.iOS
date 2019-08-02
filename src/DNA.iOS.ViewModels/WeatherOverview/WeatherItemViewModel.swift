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
    private var weatherOverView: WeatherOverview
    
    init(weatherOverView: WeatherOverview) {
        self.weatherOverView = weatherOverView
    }
    
	public var cityAndDescriptionPair: (city: String, description: String) {
        let cityName = self.weatherOverView.city.name
        let weatherDescription = self.weatherOverView.list.first?.weather.first?.description.rawValue.capitalized ?? "--"
		
		return (cityName, weatherDescription)
    }
    
    public var lowTemperature: String {
        guard let temperature = self.weatherOverView.list.first?.main.tempMin else { return "-"}
        let celsius = self.getCelsius(kelvin: temperature)
        return "\(celsius)"
    }
    
    public var highTemperature: String {
        guard let temperature = self.weatherOverView.list.first?.main.tempMax else { return "-"}
        let celsius = self.getCelsius(kelvin: temperature)
        return "\(celsius)"
    }
    
    public var weekDay: String {
        let todayDateString = self.weatherOverView.list.first?.dtTxt ?? ""
        let weekDay = self.getWeekDay(dateString: todayDateString)
        return "\(weekDay)  Today"
    }
    
    public var temperature: String {
        guard let temperature = self.weatherOverView.list.first?.main.temp else { return "-"}
        let celsius = self.getCelsius(kelvin: temperature)
        return "\(celsius)°"
    }
    
    public var listItemViewModelsOnly12: [ListItemViewModel] {
        guard self.weatherOverView.list.count >= 12 else { return self.weatherOverView.list.map({ListItemViewModel(list: $0)})}
        let lists = Array(self.weatherOverView.list[0..<12])
        let listItemViewModels = lists.map({ ListItemViewModel(list: $0) })
        return listItemViewModels
    }
    
    public var listItemViewModels: [ListItemViewModel] {
        let listItemViewModels = self.weatherOverView.list.map({ ListItemViewModel(list: $0) })
        return listItemViewModels
    }
    
    public var listItemViewModelsForWeekDays: [ListItemViewModel] {
        var lists = [ListItemViewModel]()
        for oneList in self.listItemViewModels {
            if !lists.contains(where: { $0.weekDay == oneList.weekDay}) {
                lists.append(oneList)
            }
        }
        return lists
    }
    
    public var todayDescription: String {
        let description = self.getTodayCurrentDescriptionResult(weatherOverView: self.weatherOverView)
        let todayDescrption = "Today: \(description.rawValue.capitalized). The high will be \(self.highTemperature)°. \nTonight with a low of \(self.lowTemperature)°"
        return todayDescrption
    }
    
    public var extendedInfo: [(ExtendedInfo, String)] {
        let extendedInfo = self.getInfo()
        return extendedInfo
    }
    
    private func getInfo() -> [(ExtendedInfo, String)] {
        var info = [(ExtendedInfo, String)]()
        for extendedInfoKey in ExtendedInfo.allCases {
            let tuple = (extendedInfoKey, self.setupString(key: extendedInfoKey))
            info.append(tuple)
        }
        return info
    }
    
    private func setupString(key: ExtendedInfo) -> String {
        guard let list = self.weatherOverView.list.first else { return ""}
        
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
            return addDegreeSign(toNumber: "\(self.temperature)")
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

fileprivate enum ExtendedInfoUnits: String {
	case windSpeed = "km/hr"
	case precipitation = "cm"
	case pressure = "hPa"
	case visibility = "km"
}
