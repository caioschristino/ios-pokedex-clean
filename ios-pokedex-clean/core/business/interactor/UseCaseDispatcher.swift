//
//  UseCaseDispatcher.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation


class UseCaseDispatcher <P, R> {
    var useCase : UseCase<P, R>
    var executeOn  = DispatchQueue.global()
    var resultOn = DispatchQueue.main
    
    var decorator: DispatcherDecorator<P, R>
    
    init(useCase : UseCase<P, R>) {
        self.useCase = useCase
        decorator = DispatcherDecorator(useCase: useCase, executeOn: executeOn, resultOn: resultOn)
    }

    func dispatch(param: P? = nil) {
        return decorator.dispatch(param: param)
    }

    class DispatcherDecorator<P, R>: UseCaseDecorator<P, R> {
         var executeOn: DispatchQueue
         var resultOn: DispatchQueue
    
        init(useCase: UseCase<P, R>, executeOn: DispatchQueue, resultOn: DispatchQueue) {
            self.executeOn = executeOn
            self.resultOn = resultOn
            super.init(useCase: useCase)
        }
    
        func dispatch(param: P? = nil) {
            executeOn.async {
                self.process(param: param)
            }
        }

        override func onError(err : Any) {
            resultOn.sync {
                useCase.onResult(output: err as! Output<R>)
            }
        }

        override func onResult(output: Output<R>) {
            resultOn.sync {
                useCase.onResult(output: output)
            }
        }
    }
}
