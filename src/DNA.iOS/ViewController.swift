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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        let apiService = ServiceLocator.instance.resolve(IApiService.self)!
        
        let moscowCityId = 5601538
        apiService.fetchWeatherOverview(moscowCityId).then { (overview)  in
            debugPrint(overview)
            }.catch { (error) in
                debugPrint(error)
        }
    }
}

