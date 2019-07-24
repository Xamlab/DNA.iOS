//
//  Startup.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

public extension Container {
    @discardableResult
    func registerViewModelDepdencies() -> Container {
        
        // MARK: - ViewModels -
        
        self.autoregister(IWeatherOverviewViewModel.self, initializer: WeatherOverviewViewModel.init)
        
        return self
    }
}
