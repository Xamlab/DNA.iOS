//
//  WeatherCell+UICollectionViewDelegateFlowLayout.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension WeatherCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: frame.width, height: WeatherCells.todayDescription.defaultHeight)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let cellsCount = self.datasourceItem.listItemViewModelsForWeekDays.count
		let height = WeatherCells.dailyCells(cellsCount).defaultHeight
		return CGSize(width: frame.width, height: height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
		return CGSize(width: frame.width, height: WeatherCells.extendedInfoCells.defaultHeight)
	}
}
