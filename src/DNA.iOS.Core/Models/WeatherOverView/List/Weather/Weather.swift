//
//  Weather.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

class Weather: Codable {
    let id: Int
    let main: MainEnum
    let description: Description
    let icon: String
}
