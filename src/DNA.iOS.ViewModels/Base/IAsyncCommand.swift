//
//  IAsyncCommand.swift
//  DNA.iOS.ViewModels
//
//  Created by Khachatur Hakobyan on 3/5/19.
//  Copyright © 2019 Tickster. All rights reserved.
//

import Foundation
import Bond
import Promises

public protocol IAsyncCommand : ICommand {
    var isBusy: Observable<Bool> { get }
    var isSuccessful: Observable<Bool> { get }
    var failureMessage: Observable<String?> { get }
    func executeAsync(token: CancellationToken?) -> Promise<Void>
}
