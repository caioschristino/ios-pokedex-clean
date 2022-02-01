//
//  BaseViewModel.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

protocol BaseViewModelProtocol : ViewModel {
    associatedtype P
    associatedtype R

    func disposeAll()
    
    func postValue(channelName: String, value: Any)
    
    func dispatchUseCase<P, R>(param: P?, useCase: UseCase<P, R>, listener: (_ output:Output<R>) -> Void) -> DispatchWorkItem?
}

class BaseViewModel {
    var channels = [String: [NotificationCenter]]()
    
    var compositeJobDisposable : CompositeJobDisposable?
    
    func observe(channelName: String, listener: NotificationCenter) {
        if (channels[channelName] == nil) {
            channels[channelName] = []
        }
        channels[channelName]?.append(listener)
    }
    
    func disposeAll() {
        compositeJobDisposable?.cancel()
    }

    func postValue(channelName: String, value: Any) {
        let channel = channels[channelName]
        channel?.forEach({ notificationCenter in
            notificationCenter.post(name: NSNotification.Name(channelName), object: value)
        })
    }

    func dispatchUseCase<P, R: NSObject>(
        param: P?,
        useCase: UseCase<P, R>,
        listener: @escaping (Output<R>) -> Void
    ) {
        let dispatcher = UseCaseDispatcher(useCase: CallbackDecorator(useCase: useCase, callback: listener))
        dispatcher.dispatch(param: param)
    }
}
