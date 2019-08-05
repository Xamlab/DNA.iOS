//
//  WeatherCells.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

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
