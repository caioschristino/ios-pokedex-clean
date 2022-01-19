//
//  LandingGatewayInjector.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class LandingGatewayInjector {
    static var injector: LandingGatewayInjector?
    
    let doFetch: LandingUseCase

    init(doFetch: LandingUseCase) {
        self.doFetch = doFetch
    }
}
