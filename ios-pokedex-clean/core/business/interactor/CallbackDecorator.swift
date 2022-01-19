//
//  CallbackDecorator.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class CallbackDecorator<P, R>: UseCaseDecorator<P, R> {
    var callback : ((_ output:Output<R>) -> Void)
    
    init(useCase: UseCase<P, R>, callback : @escaping ((_ output:Output<R>) -> Void)) {
        self.callback  = callback
        super.init(useCase: useCase)
    }
    
    override func onResult(output: Output<R>) {
        super.onResult(output: output)
        callback(output)
    }

    override func onError(err: Any) {
        super.onError(err: err)
        callback(ErrorOutput(error: err))
    }
}
