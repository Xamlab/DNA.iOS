//
//  DailyWeatherView.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import UIKit
import DNA_iOS_ViewModels

class DailyWeatherView: UICollectionViewCell {
	
	private lazy var cellCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.minimumLineSpacing = 0
		layout.sectionInset = UIEdgeInsets(top: 10, left: GlobalConstant.margin.value, bottom: 0, right: GlobalConstant.margin.value)
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .clear
		cv.showsVerticalScrollIndicator = false
		cv.dataSource = self
		cv.delegate = self
		cv.isScrollEnabled = false
		cv.register(DailyDetailCell.self, forCellWithReuseIdentifier: NSStringFromClass(DailyDetailCell.self))
		return cv
	}()
	
	private let separatorLineView: UIView = {
		let lineView = UIView()
		lineView.backgroundColor = UIColor(white: 0, alpha: 0.5)
		lineView.isHidden = true
		return lineView
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
		self.addSubview(self.separatorLineView)
		self.cellCollectionView.fillSuperview()
		_ = self.separatorLineView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
		
		self.separatorLineView.backgroundColor = UIColor.App.transparentWhite.value
		self.separatorLineView.isHidden = false
	}
}
