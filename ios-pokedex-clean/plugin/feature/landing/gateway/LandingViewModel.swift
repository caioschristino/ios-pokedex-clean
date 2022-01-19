//
//  LandingViewModel.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation



class LandingViewModel: BaseViewModel, LandingController {
    
    lazy var fetcher: LandingUseCase = LandingGatewayInjector.injector!.doFetch
    
    func doFetch(channelName: String) {
        dispatchUseCase(param: nil, useCase: fetcher){ output in
            self.postValue(channelName: channelName, value: output)
       }
    }
}

class LandingViewModelFactory: ViewModelFactory {
    override func createViewModel<V>(V: V.Type) -> V? where V : BaseViewModel {
        //You can return difference kind of ViewModel subclasses based on V
        // if V is your ViewModel subclass Name , then you can return it's instance
        // Also you can use Switch case here
        return LandingViewModel() as? V
    }
}
