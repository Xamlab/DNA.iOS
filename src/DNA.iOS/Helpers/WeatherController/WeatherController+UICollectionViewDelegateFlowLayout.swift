//
//  WeatherController+UICollectionViewDelegateFlowLayout.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/25/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension WeatherController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.view.frame.width, height: 720)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let topHeaderSize = CGSize(width: self.view.frame.width,
								   height: WeatherHeaders.topHeader.defaultHeight)
		let secondHeaderSize = CGSize(width: self.view.frame.width,
									  height: WeatherHeaders.centerHeader.defaultHeight)
		
		return (section == WeatherHeaders.topHeader.section ? topHeaderSize : secondHeaderSize)
	}
}
