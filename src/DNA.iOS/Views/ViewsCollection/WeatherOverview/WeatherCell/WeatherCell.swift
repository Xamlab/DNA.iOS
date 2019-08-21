//
//  WeatherCell.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import UIKit
import DNA_iOS_ViewModels

class WeatherCell: UICollectionViewCell {
	private enum Keys: String { case setOffset }
	
	private lazy var cellCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .clear
		cv.showsVerticalScrollIndicator = false
		cv.dataSource = self
		cv.delegate = self
		cv.isScrollEnabled = false
		return cv
	}()
	
	let headerView: UICollectionViewCell.Type = DailyWeatherView.self
	let cell: UICollectionViewCell.Type = TodayWeatherCell.self
	let footerView: UICollectionViewCell.Type = ExtendedInfoView.self
	
	var datasourceItem: WeatherItemViewModel! {
		didSet {
			guard let _ = self.datasourceItem else { return }
			
			self.setupViews()
		}
	}
	
	
	// MARK: - Methods Setup -
	
	func setupViews() {
		self.addSubview(cellCollectionView)
		self.cellCollectionView.fillSuperview()
		self.setupCollectionView()
		
		
		NotificationCenter.default.addObserver(self, selector: #selector(handleSetOffset), name: Notification.Name(rawValue: Keys.setOffset.rawValue), object: nil)
	}
	
	private func setupCollectionView() {
		self.cellCollectionView.register(self.headerView,
										 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
										 withReuseIdentifier: NSStringFromClass(self.headerView))
		
		self.cellCollectionView.register(self.footerView,
										 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
										 withReuseIdentifier: NSStringFromClass(self.footerView))
		
		self.cellCollectionView.register(self.cell,
										 forCellWithReuseIdentifier: NSStringFromClass(self.cell))
	}
	
	@objc private func handleSetOffset(notification: Notification) {
		guard let offset = notification.object as? CGFloat else { return }
		
		self.cellCollectionView.contentOffset = CGPoint(x: 0, y: offset)
	}
}
