//
//  BaseViewModel.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation

public protocol ViewModel {

}

public protocol StateChange {

}

open class BaseViewModel: NSObject, ViewModel {

    public override init() {}
}

open class StatefulViewModel<SC: StateChange>: BaseViewModel {

    /// State change handler block typealias
    /// Passes state change to block
    public typealias StateChangeHandler = ((SC) -> Void)

    private var stateChangeHandlers: [String: StateChangeHandler] = [:]

    /// Adds change handler and calls it later when any state change occurs
    ///
    /// - Parameters:
    ///   - identifier: Identifier of the handler's owner (optional, will be set to "" if nil)
    ///   - handler: State change handler block
    public final func addChangeHandler(identifier: String? = nil, handler: @escaping StateChangeHandler) {

        stateChangeHandlers[identifier ?? ""] = handler
    }

    /// Removes change handler for given identifier
    ///
    /// - Parameter identifier: Identifier of the handler's owner (optional, will be set to "" if nil)
    public final func removeChangeHandler(for identifier: String? = nil) {

        stateChangeHandlers.removeValue(forKey: identifier ?? "")
    }

    /// Emits current state change to all handlers
    ///
    /// - Parameter change: Change to be emitted
    public final func emit(change: SC) {

        stateChangeHandlers.values.forEach { (handler: StateChangeHandler) in

            handler(change)
        }
    }
}
