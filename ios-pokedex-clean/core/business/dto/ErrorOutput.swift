//
//  ErrorOutput.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class ErrorOutput<V> : Output<V> {
    
    init(error: Any?) {
        super.init(value: nil, error: error)
    }
    
    func isError() -> Bool {
        return true
    }
}
