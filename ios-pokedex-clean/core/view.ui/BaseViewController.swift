//
//  BaseViewController.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation
import UIKit
import SwiftUI

protocol BaseSceneProtocol {
    associatedtype C
    func setupViews(view: UIView?)

    func channelName() -> String

    func setupController() -> Controller?

    func getLayout() -> Int
}

class BaseViewController: UIViewController, BaseSceneProtocol {
    typealias C = Controller
        
    func setupViews(view: UIView?) { }

    func channelName() -> String { return "" }

    func setupController() -> Controller? { return nil }

    func getLayout() -> Int { return 0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        controller = setupController() as? LandingController
        observe(channelName: channelName(), listener: NotificationCenter.init())
        
        setupViews(view: self.view)
    }

    private func observe(channelName: String, listener: NotificationCenter) {
        controller?.observe(channelName: channelName, listener: listener)
    
        listener.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name(channelName), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        handleResponse(state: notification.object as! ValueOutput<Landing>)
    }
    
    private func handleResponse(state: ValueOutput<Landing>) {
          if (state.isError()) {
              handleThrowable(error: state.error)
          } else {
              handleSuccess(value: state.value)
          }
      }

    func handleThrowable(error: Any?) {
        switch (error) {
          case is AuthenticationException : handleAuthError()
          case is HttpException : handleHttpError(error: error)
          case is InternetConnectionException : handleConnectionError()
          default : handleError(error: error)
        }
    }

    func handleAuthError() {}

    func handleHttpError(error: Any?) {}

    func handleConnectionError() {}

    func handleError(error: Any?) {}

    func handleSuccess(value: Any?) {}

    var controller: LandingController?
}
