//
//  ValueOutput.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class ValueOutput<V> : Output<V> {
    
    init(value: V?) {
        super.init(value: value)
    }
    
    func isError() -> Bool {
        return false
    }
}
