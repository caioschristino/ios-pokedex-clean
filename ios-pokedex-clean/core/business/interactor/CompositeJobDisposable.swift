//
//  CompositeJobDisposable.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class CompositeJobDisposable {
    private var scheduler = DispatchQueue.global()
    private var executor = DispatchQueue.global()
    
    var list = [DispatchWorkItem]()
    
    init() {
        scheduler.asyncAfter(deadline: .now() + .seconds(4), execute: {
            self.purge()
        })
    }

    func add(job: DispatchWorkItem?) {
        if(job != nil) { executor.async(execute: { self.list.append(job!) }) }
    }

    func remove(job: DispatchWorkItem) {
//        executor.async(execute: { self.list.remove(: job) })
    }

    func cancel() {
//        executor.async(execute: { self.list.append(job!) }) }
//
//        executor.execute {
//            list.forEach {
//                try {
//                    if(it.isActive) it.cancel()
//                } finally {}
//            }
//            list.clear()
//        }
    }

    func purge() {
//        executor.execute {
//            if(list.size > 0) {
//                val filtered = list.filter { it.isCancelled || it.isCompleted }
//                list.removeAll(filtered as Collection<Job>)
//            }
//        }
    }
}
