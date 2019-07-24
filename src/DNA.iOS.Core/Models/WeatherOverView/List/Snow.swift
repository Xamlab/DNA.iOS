//
//  Snow.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class Snow: Codable {
    public let the3H: Double?
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}
