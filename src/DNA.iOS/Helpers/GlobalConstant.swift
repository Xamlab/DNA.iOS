//
//  GlobalConstant.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/25/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

enum GlobalConstant {
	case screenHeight
	case screenWidth
	case margin
	
	var value: CGFloat  {
		switch self {
		case .screenHeight: return UIScreen.main.bounds.height
		case .screenWidth: return UIScreen.main.bounds.width
		case .margin: return 16.0
		}
	}
}
