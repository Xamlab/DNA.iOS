//
//  VerticalWeatherCell.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import UIKit
import DNA_iOS_ViewModels

class VerticalWeatherCell: UICollectionViewCell {
	
	private let hourLabel: WhiteLabel = {
		let label = WhiteLabel(font: UIFont.systemFont(ofSize: 18))
		label.textAlignment = .center
		return label
	}()
	
	private let temperatureLabel: WhiteLabel = {
		let label = WhiteLabel(font: UIFont.systemFont(ofSize: 18))
		label.textAlignment = .center
		return label
	}()
	
	private let weatherIcon: AutoFittingImageView = {
		let iv = AutoFittingImageView()
		return iv
	}()

    var datasourceItem: ListItemViewModel! {
        didSet {
            guard let _ = self.datasourceItem else { return }
			
            self.setupViews()
            self.hourLabel.text = self.datasourceItem.hour
            self.temperatureLabel.text = self.datasourceItem.temperature
            self.weatherIcon.image = self.datasourceItem.weatherIcon
        }
    }
	
	
	// MARK: - Methods Setup -
	
	func setupViews() {
		self.addSubview(self.hourLabel)
		self.addSubview(self.temperatureLabel)
		self.addSubview(self.weatherIcon)
		
		self.weatherIcon.anchorCenterSuperview()
		self.weatherIcon.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
		self.weatherIcon.equalHeightToWidth()
		
		_ = self.temperatureLabel.anchor(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
		
		_ = self.hourLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 2, widthConstant: 0, heightConstant: 0)
	}
}


// MARK: - ListItemViewModel + UIImage -

fileprivate extension ListItemViewModel {
	var weatherIcon: UIImage? {
		guard let description = self.description else { return nil }
		
		switch self.pod {
		case .d:
			switch description {
			case .brokenClouds: return #imageLiteral(resourceName: "imageRainy")
			case .clearSky: return #imageLiteral(resourceName: "imageSunny")
			case .fewClouds: return #imageLiteral(resourceName: "imageDayPartlyCloudy")
			case .lightSnow: return #imageLiteral(resourceName: "imageNightCloudy")
			case .scatteredClouds: return #imageLiteral(resourceName: "imageDayPartlyCloudy")
			}
		case .n:
			switch description {
			case .brokenClouds: return #imageLiteral(resourceName: "imageNightPartlyCloudy")
			case .clearSky: return #imageLiteral(resourceName: "imageNightClear")
			case .fewClouds: return #imageLiteral(resourceName: "imageNightCloudy")
			case .lightSnow: return #imageLiteral(resourceName: "imageRainy")
			case .scatteredClouds: return #imageLiteral(resourceName: "imageNightCloudy")
			}
		}
	}
}
