//
//  WeatherFormatable.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import Foundation
import DNA_iOS_Core

protocol WeatherFormatable {

}

extension WeatherFormatable {
    func floatToPercentageString(float: Float) -> String {
        return "\(Int(float * 100))" + " %"
    }
    
    func addUnit<T>(_ unitName: String, toNumber: T) -> String {
        return "\(toNumber) \(unitName)"
    }
    
    func addDegreeSign<T>(toNumber: T)-> String {
        return "\(toNumber)°"
    }
    
    func getCelsius(kelvin: Double) -> String {
        let celsius: Int = Int((kelvin - 273.15))
        return celsius.description
    }
    
    func getHour(dateString: String) -> String {
        let formetter = DateFormatter()
        formetter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formetter.date(from: dateString) ?? Date()
        formetter.dateFormat = "HH"
        let hour = formetter.string(from: date)
        return hour
    }
    
    func getWeekDay(dateString: String) -> String {
        let formetter = DateFormatter()
        formetter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = formetter.date(from: dateString) ?? Date()
        let weekDay = date.dayOfWeek() ?? "--"
        return weekDay
    }
    
    func getTemperature(temp: Double) -> String {
        let temp = self.getCelsius(kelvin: temp)
        return "\(temp.description)°"
    }
	
    func getTodayCurrentDescriptionResult(_ weathers: [Weather]) -> Description {
        var frequencyOfDescription: [Description: Int] = [:]
		let descriptionTypes = weathers.map { $0.description }
        
        for description in descriptionTypes {
            frequencyOfDescription[description] = (frequencyOfDescription[description] ?? 0) + 1
        }
        
        let mostCommonDescription = frequencyOfDescription.sorted { $0.1 > $1.1 }.first?.key ?? .clearSky
        return mostCommonDescription
    }
}
