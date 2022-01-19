//
//  UseCaseDecorator.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class UseCaseDecorator<P, R> : UseCase<P, R> {
    var useCase: UseCase<P, R>
    
    init(useCase: UseCase<P, R>) {
        self.useCase = useCase
    }
    
    override func execute(param: P?) -> Output<R> {
        return useCase.execute(param: param)
    }
    
    override func onError(err: Any) {
        useCase.onError(err: err)
    }
    
    override func onResult(output: Output<R>) {
        useCase.onResult(output: output)
    }
    
    override func onGuard(param: P?) -> Bool {
        useCase.onGuard(param: param)
    }
}
