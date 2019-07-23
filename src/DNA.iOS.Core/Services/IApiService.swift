//
//  IApiService.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Promises

public protocol IApiService {
    func fetchWeatherOverview(_ cityId: Int) -> Promise<WeatherOverview>
}
