//
//  WeatherCell.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import UIKit
import DNA_iOS_ViewModels

enum WeatherCells {
	case extendedInfo
	case todayDescription
	case dailyCells(_ listsCount: Int)
	case extendedInfoCells
	
	var defaultHeight: CGFloat {
		switch self {
		case .extendedInfo:
			return 68
		case .todayDescription:
			return 74
		case let .dailyCells(listsCount):
			return CGFloat((listsCount * 30) + 20)
		case .extendedInfoCells:
			return 340
		}
	}
}

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
	
	private let headerCell: UICollectionViewCell.Type = DailyWeatherCell.self
	private let footerCell: UICollectionViewCell.Type = ExtendedInfoCell.self
	private let cell: UICollectionViewCell.Type = TodayWeatherCell.self

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
		self.cellCollectionView.register(self.headerCell, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(self.headerCell))
		self.cellCollectionView.register(self.footerCell, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(self.footerCell))
		self.cellCollectionView.register(self.cell, forCellWithReuseIdentifier: NSStringFromClass(self.cell))
	}
	
	@objc private func handleSetOffset(notification: Notification) {
		guard let offset = notification.object as? CGFloat else { return }
		self.cellCollectionView.contentOffset = CGPoint(x: 0, y: offset)
	}
}


// MARK: - UICollectionViewDataSource -

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
			guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(self.headerCell), for: indexPath) as? DailyWeatherCell else { return reusableView }
			header.datasourceItem = self.datasourceItem.listItemViewModelsForWeekDays
			reusableView = header
		case UICollectionView.elementKindSectionFooter:
			guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NSStringFromClass(self.footerCell), for: indexPath) as? ExtendedInfoCell else { return reusableView }
			footer.datasourceItem = self.datasourceItem.extendedInfo
			reusableView = footer
		default: break
		}
		return reusableView
	}
}


// MARK: - UICollectionViewDelegateFlowLayout -

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

