//
//  main.swift
//  DNA.iOS
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import UIKit
import DNA_iOS_Core

_ = autoreleasepool {
    ServiceLocator.instance
        .registerCoreDependencies()
        .registerViewModelDepdencies()
    
    UIApplicationMain(CommandLine.argc,
                      CommandLine.unsafeArgv,
                      NSStringFromClass(UIApplication.self),
                      NSStringFromClass(AppDelegate.self)
    )
}
