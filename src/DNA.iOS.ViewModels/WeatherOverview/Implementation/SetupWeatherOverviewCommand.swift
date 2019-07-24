//
//  SetupWeatherOverviewCommand.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import DNA_iOS_Core

internal class SetupWeatherOverviewCommand: Command {
    private weak var viewModel: WeatherOverviewViewModel!
    private let loctionManager: ILoctionManager
    
    
    init(_ viewModel: WeatherOverviewViewModel,
         _ loctionManager: ILoctionManager) {
        self.viewModel = viewModel
        self.loctionManager = loctionManager
    }
    
    override func execute() {
        self.loctionManager.setCurrentCityUpdatedHandler { [unowned self] (city) in
            guard self.viewModel.currentCity.value != city else { return }
            
            self.viewModel.currentCity.value = city
        }
        
        self.loctionManager.setAuthorizationStatusUpdatedHandler { (status) in
            self.viewModel.authorizationStatus.value = status
        }
        
        self.loctionManager.requestAuthorization(.always, true)
        
        self.viewModel.currentCity.observeNext { [unowned self] (_) in self.viewModel.loadCommand.execute() }.dispose(in: self.bag)
    }
}
