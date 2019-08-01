//
//  WeatherSecondHeaderCellCollectionViewCell.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import UIKit
import DNA_iOS_ViewModels

class WeatherSecondHeaderCell: UICollectionViewCell {
	private let topSeparator = SeparationLineView()
	private let bottomSeparator = SeparationLineView()
	
	private lazy var cellCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .clear
		cv.showsHorizontalScrollIndicator = false
		cv.dataSource = self
		cv.delegate = self
		cv.register(VerticalWeatherCell.self, forCellWithReuseIdentifier: NSStringFromClass(VerticalWeatherCell.self))
		return cv
	}()
	
    var datasourceItem: [ListItemViewModel]! {
        didSet{
            guard let _ = self.datasourceItem else { return }
			
            self.setupViews()
        }
    }
	
	
	// MARK: - Methods Setup -
	
	func setupViews() {
		self.addSubview(self.cellCollectionView)
		self.addSubview(self.topSeparator)
		self.addSubview(self.bottomSeparator)
		
		self.cellCollectionView.fillSuperview()
		
		self.topSeparator.anchorToTop(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor)
		self.topSeparator.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale).isActive = true
		
		self.bottomSeparator.anchorToTop(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
		self.bottomSeparator.heightAnchor.constraint(equalToConstant:  1 / UIScreen.main.scale).isActive = true
	}
}
