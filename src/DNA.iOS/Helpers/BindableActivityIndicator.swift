//
//  BindableActivityIndicator.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/1/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Lottie
import Bond

@IBDesignable
open class BindableActivityIndicator: UIView {
	public private(set) var animationView: AnimationView?
	public var animate = Observable<Bool>(false)
	
	@IBInspectable
	public var animationName: String? {
		didSet {
			self.animationView?.removeFromSuperview()
			self.animationView = AnimationView(name: animationName!)
			guard let animationView = self.animationView else { return }
			self.add(animationView)
		}
	}
	
	@IBInspectable
	public var loop: Bool = true {
		didSet {
			self.animationView?.loopMode = (self.loop ? .loop : .playOnce)
		}
	}
	
	
	override open func awakeFromNib() {
		super.awakeFromNib()
		self.setup()
	}
	
	private func setup() {
		self.animate.observeNext { [unowned self] animating in
			self.animationView?.isHidden = !animating
			animating ? self.animationView?.play() : self.animationView?.stop()
			}.dispose(in: self.bag)
	}
	
	
	private func add(_ animationView: AnimationView) {
		self.addSubview(animationView)
		
		animationView.translatesAutoresizingMaskIntoConstraints = false
		animationView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		animationView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		animationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		animationView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		
		animationView.contentMode = .scaleAspectFit
		animationView.isHidden = true
	}
}
