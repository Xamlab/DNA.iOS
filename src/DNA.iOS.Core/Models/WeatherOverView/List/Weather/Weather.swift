//
//  Weather.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

public class Weather: Codable {
    public let id: Int
    public let main: MainEnum
    public let description: Description
    public let icon: String
}
