//
//  WeatherController.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import UIKit
import DNA_iOS_ViewModels
import Bond

class WeatherController: UIViewController {
	let headerCells: [UICollectionViewCell.Type] = [WeatherTopHeaderCell.self, WeatherSecondHeaderCell.self]
	let cells: [UICollectionViewCell.Type] = [WeatherCell.self]
	var weatherItemViewModel: Observable<WeatherItemViewModel?> = Observable<WeatherItemViewModel?>(nil)
	var collectionView: UICollectionView! = nil

	private let backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.animationImages = [#imageLiteral(resourceName: "imageBlueSkyBackground"), #imageLiteral(resourceName: "imageNight")]
		imageView.animationDuration = 15
		imageView.startAnimating()
		imageView.image = #imageLiteral(resourceName: "imageBlueSkyBackground")
		imageView.clipsToBounds = true
		return imageView
	}()
	
	let errorMessageLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 18)
		label.text = "Sorry, something went wrong. Please try again later..."
		label.textAlignment = .center
		label.numberOfLines = 0
		label.isHidden = true
		return label
	}()
	
	let activityIndicatorView: UIActivityIndicatorView = {
		let aiv = UIActivityIndicatorView(style: .whiteLarge)
		aiv.hidesWhenStopped = true
		aiv.color = .white
		return aiv
	}()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
		self.setupActivityIndicator()
		self.setupErrorMessageLabel()
		self.setupCollectionView()
    }
	
	
	// MARK: - Methods Setup -

    private func setup() {
        self.weatherItemViewModel.observeNext { [unowned self] (_) in
            self.collectionView.reloadData()
        }.dispose(in: self.bag)
    }
    
	private func setupActivityIndicator() {
		self.view.addSubview(self.activityIndicatorView)
		self.activityIndicatorView.anchorCenterXToSuperview()
		self.activityIndicatorView.anchorCenterYToSuperview(constant: 22)
	}
	
	private func setupErrorMessageLabel() {
		self.view.addSubview(self.errorMessageLabel)
		self.errorMessageLabel.anchorCenterSuperview()
		self.errorMessageLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
		self.errorMessageLabel.equalHeightToWidth()
	}
	
	private func setupCollectionView() {
		self.collectionView.collectionViewLayout = WeatherCollectionViewFlowLayout()
		self.collectionView.backgroundView = self.backgroundImageView
		self.collectionView.showsVerticalScrollIndicator = false
		self.collectionView.alwaysBounceVertical = true
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
		for headerClass in self.headerCells {
			self.collectionView.register(headerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(headerClass))
		}
		for cellClass in self.cells {
			self.collectionView.register(cellClass, forCellWithReuseIdentifier: NSStringFromClass(cellClass))
		}
	}
}
