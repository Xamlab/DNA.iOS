//
//  WeatherOverviewViewModel.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import DNA_iOS_Core
import UIKit
import Bond

internal class WeatherOverviewViewModel: IWeatherOverviewViewModel, WeatherFormatable {
    private let loctionManager: ILoctionManager
    private let apiService: IApiService
    lazy var setupCommand: ICommand = SetupWeatherOverviewCommand(self, self.loctionManager)
    lazy var loadCommand: IAsyncCommand = LoadWeatherOverviewCommand(self, self.apiService)
    var currentCity: Observable<City?> = Observable<City?>(nil)
    var locationAuthorizationStatus: Observable<LocationAuthorizationStatus> = Observable<LocationAuthorizationStatus>(.notDetermined)
    var result: Observable<WeatherItemViewModel?> = Observable<WeatherItemViewModel?>(nil)
    
    
    init(_ loctionManager: ILoctionManager,
         _ apiService: IApiService) {
        self.loctionManager = loctionManager
        self.apiService = apiService
    }
}

