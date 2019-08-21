//
//  WeatherHeaders.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/25/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

enum WeatherHeaders: Int {
	case topHeader
	case centerHeader
	
	var section: Int { return self.rawValue }
	
	var defaultHeight: CGFloat {
		switch self {
		case .topHeader:
			return 0.48 * GlobalConstant.screenHeight.value
		case .centerHeader:
			return 0.17 * GlobalConstant.screenHeight.value
		}
	}
	
	var minimumHeight: CGFloat {
		switch self {
		case .topHeader:
			return 100
		case .centerHeader:
			return self.defaultHeight
		}
	}
}

