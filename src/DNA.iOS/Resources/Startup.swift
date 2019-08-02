//
//  Startup.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 8/2/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import DNA_iOS_Core

public extension Container {
	@discardableResult
	func registerDependencies() -> Container {
		
		// MARK: - Respositories -
		self.autoregister(ICityRespository.self, initializer: CityRepository.init)
		
		//Managers
		self.autoregister(ILoctionManager.self, initializer: LocationManager.init)

		return self
	}
}
