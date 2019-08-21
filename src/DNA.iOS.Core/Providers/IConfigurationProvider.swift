//
//  IConfigurationProvider.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public protocol IConfigurationProvider {
    var apiVersion: String { get }
    var apiBaseUrl: String { get }
    var apiId: String { get }
}
