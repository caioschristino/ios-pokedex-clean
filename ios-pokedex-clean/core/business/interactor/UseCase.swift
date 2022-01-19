//
//  UseCase.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation


protocol ProtocolUseCase {
    associatedtype P
    associatedtype R
    
    func process(param: P?)
    
    func execute(param: P?) -> Output<R>
    
    func onError(err: Any)
    
    func onResult(output: Output<R>)
    
    func onGuard(param: P?) -> Bool
    
    func onGuardError()
}

class UseCase<P, R> : ProtocolUseCase {
    typealias P = P
    typealias R = R
    
    func process(param: P?) {
        do {
            if (onGuard(param: param)) {
                let output = execute(param: param)
                onResult(output: output)
            } else {
               onGuardError()
            }
        } catch let error {
            onError(err: error)
        }
    }
    
    func onError(err: Any) {
        onResult(output: ErrorOutput(error: err))
    }
    
    func onGuard(param: P?) -> Bool {
        return true
    }
    
    func execute(param: P?) -> Output<R> {
        return Output<R>(value: nil)
    }
    
    func onResult(output: Output<R>) { }
    
    func onGuardError() { }
}
