//
//  ExtendedDetailCell.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 4/26/19.
//  Copyright © 2019 Khachatur Hakobyan. All rights reserved.
//

import UIKit
import DNA_iOS_ViewModels
import DNA_iOS_Core

class ExtendedDetailCell: UICollectionViewCell {
	
	private let extendedInfoTextView: PassiveTextView = {
		let tv = PassiveTextView()
		return tv
	}()
	
	private let separatorLineView: UIView = {
		let lineView = UIView()
		lineView.backgroundColor = UIColor(white: 0, alpha: 0.5)
		lineView.isHidden = true
		return lineView
	}()
    
    var datasourceItem: (key: ExtendedInfo, value: String)! {
        didSet {
            guard let _ = self.datasourceItem else { return }
            self.setupViews()
            let key = self.datasourceItem.key
            let value = self.datasourceItem.value

            let attributedText = NSMutableAttributedString.setupWithText(key.stringValue, description: "\n\(value)",
                textFont: UIFont.systemFont(ofSize: 14),
                descriptionFont: UIFont.systemFont(ofSize: 28),
                textColor: UIColor.App.transparentWhite.value,
                descriptionColor: .white)
            attributedText?.setLineSpacing(1.0)
            self.extendedInfoTextView.attributedText = attributedText
        }
    }
	
	
	// MARK: - Methods Setup -
	
	func setupViews() {
		self.addSubview(self.extendedInfoTextView)
		self.addSubview(self.separatorLineView)
		self.extendedInfoTextView.fillSuperview()
		_ = self.separatorLineView.anchor(top: nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
		self.separatorLineView.backgroundColor = UIColor.App.transparentWhite.value
		self.separatorLineView.isHidden = false
	}
}


fileprivate extension NSMutableAttributedString {
    class func setupWithText(_ text: String, description: String, textFont: UIFont, descriptionFont: UIFont, textColor: UIColor, descriptionColor: UIColor) -> NSMutableAttributedString?{
        
        let textAttribute = [NSAttributedString.Key.font: textFont, NSAttributedString.Key.foregroundColor: textColor]
        let descriptionAttribute = [NSAttributedString.Key.font: descriptionFont, NSAttributedString.Key.foregroundColor: descriptionColor]
        
        let attributedText = NSMutableAttributedString(string: text,
                                                       attributes: textAttribute)
        let descriptionAttributedString = NSMutableAttributedString(string: description,
                                                                    attributes:  descriptionAttribute)
        attributedText.append(descriptionAttributedString)
        return attributedText
    }
    
    func setLineSpacing(_ lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        self.setParagraphStyle(paragraphStyle: paragraphStyle)
    }
    
    func setParagraphStyle(paragraphStyle: NSParagraphStyle) {
        let range = NSMakeRange(0, self.string.count)
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
    }
}

