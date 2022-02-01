//
//  Output.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

protocol ProtocolOutput  {
    associatedtype V
    
    var value: V? { get set }
    
    var error: Any? { get set }
    
    func isError() -> Bool
    
    func isSuccess() -> Bool
    
    func isEmpty() -> Bool

}

extension ProtocolOutput {
    func isError() -> Bool {
        return error != nil
    }
    
    func isSuccess() -> Bool {
        return !isError()
    }
    
    func isEmpty() -> Bool {
        return value != nil
    }
}

class Output<V> : ProtocolOutput {
    var value: V?
    
    var error: Any?
    
    typealias V  = V
    
    init(value: V?,  error: Any? = nil) {
        self.value = value
        self.error = error
    }
}
