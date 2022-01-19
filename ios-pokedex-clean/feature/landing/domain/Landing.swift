//
//  Landing.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class Landing {
    var count: Int
    var next: String
    var results: [Pokemon]
    
    
    init(count: Int, next: String, results: [Pokemon]) {
        self.count = count
        self.next = next
        self.results = results
    }
}
