//
//  City+Equatable.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 8/5/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

extension City: Equatable {
	public static func == (lhs: City, rhs: City) -> Bool {
		return lhs.name == rhs.name
	}
}
