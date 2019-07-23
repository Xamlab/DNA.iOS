//
//  CoreError.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public enum CoreError: Error {
    case httpException(message: String, code: Int?)
}
