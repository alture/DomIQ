//
//  LoginRouter.swift
//  DomIQ
//
//  Created by Alisher on 5/17/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

final class LoginRouter {
  
  // MARK: Properties
  
  weak var view: UIViewController?
  
  // MARK: Static methods
  
  static func setupModule() -> LoginViewController {
    let viewController = UIStoryboard(name: "Login",
    bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginViewController
    let presenter = LoginPresenter()
    let router = LoginRouter()
    let interactor = LoginInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    
    return viewController
  }
}

extension LoginRouter: LoginWireframe {
  func showMain() {
    let vc = MainRouter.setupModule()
    let navVC = UINavigationController(rootViewController: vc)
    navVC.isNavigationBarHidden = true
    navVC.modalPresentationStyle = .fullScreen
    view?.present(navVC, animated: true, completion: nil)
  }
}
