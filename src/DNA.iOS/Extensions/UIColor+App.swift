//
//  UIColor+App.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit

extension UIColor {
    enum App: String {
        case lightBlue
        case transparentWhite
        case dirtyWhite
        
        var value: UIColor {
            return UIColor(named: self.rawValue)!
        }
    }
}
