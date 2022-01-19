//
//  Controller.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

protocol Controller {
    func observe(channelName: String, listener: NotificationCenter)
}

extension Controller {
    func observe(channelName: String, listener: NotificationCenter) {    }
}
