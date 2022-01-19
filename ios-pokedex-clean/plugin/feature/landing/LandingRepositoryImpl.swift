//
//  LandingRepositoryImpl.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class LandingRepositoryImpl : LandingRepository {
    func doFetch() -> Landing? {
        let pokemons = [Pokemon(name: "TESTE", url: "", ilike: true)]
        return Landing(count: 0, next:"", results: pokemons)
    }
}
