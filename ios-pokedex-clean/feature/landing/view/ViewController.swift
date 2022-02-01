//
//  ViewController.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import UIKit

class ViewController: BaseViewController<LandingController> {

    override func viewDidLoad() {
        super.viewDidLoad()
        controller.doFetch(channelName: channelName())
    }
    
    override func setupViews(view: UIView?) {
        view.hashValue
        
    }
    
    override func channelName() -> String {
        "LandingViewController"
    }

    
    override func setupController() -> LandingController {
        let injector =  LandingViewInjector.injector!
                .controllerFactory.create(context: self)!

        return injector
    }
}
