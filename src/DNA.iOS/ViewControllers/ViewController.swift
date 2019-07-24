//
//  ViewController.swift
//  DNA.iOS
//
//  Created by Gagik Kyurkchyan on 7/19/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit
import DNA_iOS_Core

class ViewController: UIViewController {
    let locationManager = ServiceLocator.instance.resolve(ILoctionManager.self)!
    var currentCity: City! { didSet { self.fetchWeatherOverview() }}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLocationManager()
    }
    
    private func setupLocationManager() {
        self.locationManager.setCurrentCityUpdatedHandler { [unowned self] (city) in
            guard self.currentCity != city else { return }
            print(city)
            self.currentCity = city
        }
        self.locationManager.requestAuthorization(.always, true)
    }
    
    private func fetchWeatherOverview() {
        let apiService = ServiceLocator.instance.resolve(IApiService.self)!
        apiService.fetchWeatherOverview(self.currentCity).then { (overview)  in
            debugPrint(overview)
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

