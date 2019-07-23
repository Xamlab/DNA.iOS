//
//  ConfigurationProvider.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Foundation

internal class ConfigurationProvider: IConfigurationProvider {
    private enum Keys: String { case CFBundleShortVersionString, ApiBaseURL, ApiId }
    
    lazy var apiVersion: String = {
        return Bundle.main.infoDictionary![Keys.CFBundleShortVersionString.rawValue] as! String
    }()

    lazy var apiBaseUrl: String = {
       return Bundle.main.infoDictionary![Keys.ApiBaseURL.rawValue] as! String
    }()
    
    lazy var apiId: String = {
        return Bundle.main.infoDictionary![Keys.ApiId.rawValue] as! String
    }()
}
