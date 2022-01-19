//
//  ControllerFactory.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class ControllerFactory<V, T> : Controller {
    func create(context: V)-> T? { return nil }
}
