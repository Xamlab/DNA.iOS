//
//  IWeatherOverviewViewModel.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Bond
import DNA_iOS_Core

public protocol IWeatherOverviewViewModel {
    var setupCommand: ICommand { get }
    var loadCommand: IAsyncCommand { get }
    var currentCity: Observable<City?> { get }
    var locationAuthorizationStatus: Observable<LocationAuthorizationStatus> { get }
    var result: Observable<WeatherItemViewModel?> { get }
}
