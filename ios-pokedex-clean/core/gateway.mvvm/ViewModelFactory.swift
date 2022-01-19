//
//  ViewModelFactory.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 14/01/22.
//

import Foundation

class ViewModelFactory {
    required init() {}
    func createViewModel<V: BaseViewModel>(V: V.Type) -> V? {return nil}
   
}
