//
//  DailyWeatherView+UICollectionViewDelegateFlowLayout.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension DailyWeatherView: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.frame.width - 2 * GlobalConstant.margin.value, height: 30)
	}
}
