//
//  DispatchQueue.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 18/01/22.
//

import Foundation


extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) -> (() -> Void)?{
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
        
        return completion
    }

}
