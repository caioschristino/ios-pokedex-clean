//
//  LandingUseCase.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Foundation

class LandingUseCase : UseCase<Void, Landing> {
     var repo: LandingRepository
    
    init(repo: LandingRepository){
        self.repo = repo
    }
    
    override func execute(param: Void?) -> Output<Landing> {
        let landing = repo.doFetch()
        return ValueOutput(value: landing)
    }
}
