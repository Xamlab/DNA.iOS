//
//  IWeatherOverviewViewModel.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Bond
import DNA_iOS_Core
import CoreLocation

public protocol IWeatherOverviewViewModel {
    var setupCommand: ICommand { get }
    var loadCommand: IAsyncCommand { get }
    var currentCity: Observable<City?> { get }
    var authorizationStatus: Observable<CLAuthorizationStatus> { get }
    var result: Observable<WeatherItemViewModel?> { get }
}
