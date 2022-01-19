//
//  LandingViewInjector.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import UIKit

class LandingViewInjector {
    static var injector: LandingViewInjector?
    
    let controllerFactory: ControllerFactory<ViewController, LandingController>

    init(controllerFactory: ControllerFactory<ViewController, LandingController>) {
        
        self.controllerFactory = controllerFactory
    }
}
