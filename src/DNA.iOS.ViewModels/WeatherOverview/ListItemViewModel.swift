//
//  ListItemViewModel.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/27/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import DNA_iOS_Core
import UIKit

public struct ListItemViewModel: WeatherFormatable {
    private var list: List
    
    init(list: List) {
        self.list = list
    }
    
    public var hour: String {
        let hour = self.getHour(dateString: self.list.dtTxt)
        return hour
    }
    
    public var weekDay: String {
        let weekDay = self.getWeekDay(dateString: self.list.dtTxt)
        return weekDay
    }
    
    public var temperature: String {
        let temperature = self.getTemperature(temp: self.list.main.temp)
        return temperature
    }
    
   public var lowTemperature: String {
        let temperature = self.list.main.tempMin
        let celsius = self.getCelsius(kelvin: temperature)
        return "\(celsius)"
    }
    
    public var highTemperature: String {
        let temperature = self.list.main.tempMax
        let celsius = self.getCelsius(kelvin: temperature)
        return "\(celsius)"
    }
    
    public var weatherIcon: UIImage? {
        guard let weather = self.list.weather.first else { return nil}
        let weatherIcon = self.getWeatherIcon(description: weather.description, pod: self.list.sys.pod)
        return weatherIcon
    }
}
