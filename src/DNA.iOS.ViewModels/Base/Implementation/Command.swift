//
//  Command.swift
//  BoxpointViewModels
//
//  Created by Khachatur Hakobyan on 3/5/19.
//  Copyright © 2019 Tickster. All rights reserved.
//

import Foundation
import Bond

internal class Command : NSObject, ICommand {
    var isEnabled: Observable<Bool> = Observable<Bool>(false)
    
    init (isEnabled: Bool = true) {
        self.isEnabled.value = isEnabled
    }
    
    func setEnabled(value: Bool) {
        isEnabled.value = value
    }
    
    public func execute() {
        
    }
}
