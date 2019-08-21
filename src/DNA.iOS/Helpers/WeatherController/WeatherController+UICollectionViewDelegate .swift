//
//  WeatherController+UICollectionViewDelegate .swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/25/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension WeatherController: UICollectionViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		let headerHeightMaxChange = WeatherHeaders.topHeader.defaultHeight - WeatherHeaders.topHeader.minimumHeight
		var subOffset: CGFloat = 0
		
		if offsetY > headerHeightMaxChange {
			subOffset = offsetY - headerHeightMaxChange
		} else {
			subOffset = 0
		}
		
		enum Keys: String { case setOffset }
		
		NotificationCenter.default.post(name: Notification.Name(rawValue: Keys.setOffset.rawValue), object: subOffset)
	}
}
