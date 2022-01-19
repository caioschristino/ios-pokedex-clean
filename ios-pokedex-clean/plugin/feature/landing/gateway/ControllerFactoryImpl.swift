//
//  ControllerFactoryImpl.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class ControllerFactoryImpl : ControllerFactory<ViewController, LandingController> {
    
    override func create(context: ViewController) -> LandingController? {
        
        let homeViewModelfactory = LandingViewModelFactory.init()
        let viewmodel =  ViewModelProvider.of(viewModelFactory: homeViewModelfactory, Model: LandingViewModel.self)
        
        return viewmodel as? LandingController
    }
}
