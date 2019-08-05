//
//  WeatherCell+UICollectionViewDataSource.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension WeatherCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TodayWeatherCell.self), for: indexPath) as? TodayWeatherCell else { return UICollectionViewCell() }
		
		cell.datasourceItem = self.datasourceItem.todayDescription
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		var reusableView = UICollectionViewCell()
		
		switch kind {
		case UICollectionView.elementKindSectionHeader:
			guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(self.headerView), for: indexPath) as? DailyWeatherView else { return reusableView }
			
			header.datasourceItem = self.datasourceItem.listItemViewModelsForWeekDays
			
			reusableView = header
		case UICollectionView.elementKindSectionFooter:
			guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(self.footerView), for: indexPath) as? ExtendedInfoView else { return reusableView }
			
			footer.datasourceItem = self.datasourceItem.extendedInfo
			
			reusableView = footer
		default:
			break
		}
		
		return reusableView
	}
}
