//
//  WeatherOverviewViewController.swift
//  DNA.iOS
//
//  Created by Gagik Kyurkchyan on 7/19/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit
import DNA_iOS_Core
import DNA_iOS_ViewModels
import ReactiveKit

class WeatherOverviewViewController: WeatherController {
    @IBOutlet weak var weatherCollectionView: UICollectionView!
	@IBOutlet weak var activityIndicator: BindableActivityIndicator!
	private var viewModel: IWeatherOverviewViewModel!
	
	
    override func viewDidLoad() {
        self.initialSetup()
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    private func initialSetup() {
        self.collectionView = self.weatherCollectionView
    }
    
    private func setupViewModel() {		
        self.viewModel = ServiceLocator.instance.resolve(IWeatherOverviewViewModel.self)
        
        self.viewModel.result.bind(to: self.weatherItemViewModel).dispose(in: self.bag)
		
		self.viewModel.loadCommand.isBusy.bind(to: self.activityIndicator.animate).dispose(in: self.bag)
		
        self.viewModel.setupCommand.execute()
    }
}

