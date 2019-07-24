//
//  ICommand.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 3/5/19.
//  Copyright © 2019 Tickster. All rights reserved.
//

import Foundation
import Bond

public protocol ICommand {
    var isEnabled: Observable<Bool> { get }
    func execute()
    func setEnabled(value: Bool)
}
