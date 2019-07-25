//
//  WeatherController+UICollectionViewDataSource.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/25/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension WeatherController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return (self.weatherItemViewModel.value == nil ? 0 : self.headerCells.count)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return (section == WeatherHeaders.topHeader.section ? 0 : self.cells.count)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WeatherCell.self), for: indexPath) as? WeatherCell else { return UICollectionViewCell() }
		
		cell.datasourceItem = self.weatherItemViewModel.value
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionViewCell() }
		
		var reusableView = UICollectionViewCell()
		
		switch indexPath.section {
		case WeatherHeaders.topHeader.section:
			guard let topHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(WeatherTopHeaderCell.self), for: indexPath) as? WeatherTopHeaderCell else { return reusableView }
			
			topHeaderCell.datasourceItem = self.weatherItemViewModel.value
			reusableView = topHeaderCell
			
		case WeatherHeaders.centerHeader.section:
			guard let secondHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(WeatherSecondHeaderCell.self), for: indexPath) as? WeatherSecondHeaderCell else { return reusableView }
			
			secondHeaderCell.datasourceItem = self.weatherItemViewModel.value?.listItemViewModels
			reusableView = secondHeaderCell
			
		default: break
		}
		
		return reusableView
	}
}

