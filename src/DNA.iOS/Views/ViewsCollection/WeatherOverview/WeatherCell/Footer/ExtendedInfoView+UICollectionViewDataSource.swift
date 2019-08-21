//
//  ExtendedInfoView+UICollectionViewDataSource.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension ExtendedInfoView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.datasourceItem.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ExtendedDetailCell.self), for: indexPath) as? ExtendedDetailCell else { return UICollectionViewCell() }
		
		cell.datasourceItem = self.datasourceItem[indexPath.row]
		
		return cell
	}
}
