//
//  Startup.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

public extension Container {
    @discardableResult
    func registerCoreDependencies() -> Container {
        
        // MARK: - Providers -
        self.autoregister(IConfigurationProvider.self, initializer: ConfigurationProvider.init)

        // MARK: - Managers -
        self.autoregister(ILoctionManager.self, initializer: LocationManager.init)
        
        // MARK: - Services -
        self.autoregister(IApiService.self, initializer: ApiService.init)
        
        return self
    }
}
