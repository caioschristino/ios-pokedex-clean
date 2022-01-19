//
//  Pokemon.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class Pokemon {
    var name: String
    var url: String
    var ilike: Bool
    
    init(name: String, url: String, ilike: Bool) {
        self.name = name
        self.url = url
        self.ilike = ilike
    }

}
