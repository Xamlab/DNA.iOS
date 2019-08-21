//
//  LocationAuthorizationStatus.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 8/2/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public enum LocationAuthorizationStatus: Int32 {
	case notDetermined
	case restricted
	case denied
	case authorizedAlways
	case authorizedWhenInUse
}
