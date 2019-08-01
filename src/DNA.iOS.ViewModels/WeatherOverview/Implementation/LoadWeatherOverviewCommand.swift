//
//  LoadWeatherOverviewCommand.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 7/24/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import DNA_iOS_Core
import Promises

internal class LoadWeatherOverviewCommand: AsyncCommand {
    private weak var viewModel: WeatherOverviewViewModel!
    private let apiService: IApiService
    
    
    init(_ viewModel: WeatherOverviewViewModel,
         _ apiService: IApiService) {
        self.viewModel = viewModel
        self.apiService = apiService
    }
    
    override func executeCoreAsync(token: CancellationToken?) -> Promise<Bool> {
        guard let city = self.viewModel.currentCity.value else { return Promise(false) }
		
		self.viewModel.result.value = nil
		
        return self.apiService.fetchWeatherOverview(city)
            .then { [unowned self] (weatherOverview) in
                self.viewModel.result.value = WeatherItemViewModel(weatherOverView: weatherOverview)
                
                return Promise(true)
            }.catch { (error) in
                guard let coreError = error as? CoreError else { return }
                
                switch coreError {
                case .noInternetConnection:
                    debugPrint("noInternetConnection")
                case .notFoundedCityInRepository:
                    debugPrint("notFoundedCityInRepository")
                case let .httpException(message, code):
                    print("httpException = ", message, ", ", code ?? String())
                }
                debugPrint(error)
        }
    }
}
