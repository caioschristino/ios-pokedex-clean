//
//  ViewModelProvider.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 14/01/22.
//

import Foundation

class ViewModelProvider {

    private static let provider = ViewModelProvider()
    
    fileprivate var map: [String : BaseViewModel] = [String: BaseViewModel]()
    
    static func of(viewModelFactory:ViewModelFactory, Model:BaseViewModel.Type) -> BaseViewModel? {
        return provider.createViewModelFromFactory(factory:viewModelFactory, Model:Model)
    }
    
    fileprivate func createViewModelFromFactory(factory:ViewModelFactory,Model: BaseViewModel.Type) -> BaseViewModel? {
       let hash = "viewmodelhash_\(Model.self)"
        if let cachedV = map[hash]  {
            print("called from cache")
            return cachedV
        }
        
        let viewModel = factory.createViewModel(V: Model)
        map[hash] = viewModel
        return viewModel
    }
}
