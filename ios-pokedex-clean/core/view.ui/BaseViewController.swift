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

    func setupController() -> C

    func getLayout() -> Int
}

class BaseViewController<C> : UIViewController, BaseSceneProtocol {
    typealias C = C
    
    lazy var controller = { setupController() }()
    
    func setupViews(view: UIView?) { }

    func channelName() -> String { return "" }

    func getLayout() -> Int { return 0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        observe(channelName: channelName(), listener: NotificationCenter.init())
        setupViews(view: self.view)
    }
    
    func setupController() -> C {
        return C.self as! C
    }

    private func observe(channelName: String, listener: NotificationCenter) {
        let cnt = controller as! Controller
        cnt.observe(channelName: channelName, listener: listener)
    
        listener.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name(channelName), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        let state = notification.object as! ValueOutput<NSObject>
        handleResponse(state: state)
    }
    
    private func handleResponse(state: ValueOutput<NSObject>) {
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
}
