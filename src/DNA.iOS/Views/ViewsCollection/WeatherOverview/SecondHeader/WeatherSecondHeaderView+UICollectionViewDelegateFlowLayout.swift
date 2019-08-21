//
//  WeatherSecondHeaderView+UICollectionViewDelegateFlowLayout.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/25/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension WeatherSecondHeaderView: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 42, height: self.frame.height - 20)
	}
}
