//
//  AsyncCommand.swift
//  BoxpointViewModels
//
//  Created by Khachatur Hakobyan on 3/5/19.
//  Copyright © 2019 Tickster. All rights reserved.
//

import Foundation
import Bond
import Promises

internal class AsyncCommand: Command, IAsyncCommand {
    public var isBusy = Observable<Bool>(false)
    public var isSuccessful = Observable<Bool>(false)
    public var failureMessage = Observable<String?>(nil)
    
    public override func execute() {
        executeAsync()
    }
    
    @discardableResult
    public func executeAsync(token: CancellationToken? = nil) -> Promise<Void> {
        if !isEnabled.value {
            return Promise(Void())
        }

        isBusy.value = true
        isSuccessful.value = false
        failureMessage.value = nil
        return executeCoreAsync(token: token).then { [unowned self] isSuccessful in
                self.isSuccessful.value = isSuccessful
            }
            .always {
                self.isBusy.value = false
            }
            .catch { error in
                self.handleError(error)
        }
    }
    
    @discardableResult
    internal func executeCoreAsync(token: CancellationToken?) -> Promise<Bool> {
        preconditionFailure("This method must be overridden")
    }
    
    internal func handleError(_ error: Error) {
       print(error)
       failureMessage.value = "Something went wrong while executing operation. Please try again."
    }
}
