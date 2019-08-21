//
//  ExtendedInfoView+UICollectionViewDelegateFlowLayout.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension ExtendedInfoView: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (frame.width - 2 * GlobalConstant.margin.value) / 2, height: WeatherCells.extendedInfo.defaultHeight)
	}
}

