//
//  MainRouter.swift
//  DomIQ
//
//  Created by Alisher on 5/18/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

final class MainRouter {
  
  // MARK: Properties
  
  weak var view: UIViewController?
  
  // MARK: Static methods
  
  static func setupModule() -> MainViewController {
    let viewController = UIStoryboard(name: "Main",
    bundle: nil).instantiateViewController(identifier: "MainVC") as! MainViewController
    let presenter = MainPresenter()
    let router = MainRouter()
    let interactor = MainInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    return viewController
  }
}

extension MainRouter: MainWireframe {
  func showCamera() {
    let vc = CameraRouter.setupModule()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
  
  func showLoginView() {
    let vc = LoginRouter.setupModule()
    vc.modalPresentationStyle = .fullScreen
    view?.present(vc, animated: true, completion: nil)
  }
  
  func showControl() {
    let vc = ControlRouter.setupModule(.control)
    view?.navigationController?.pushViewController(vc, animated: true)
  }
  
  func showSecurity() {
    let vc = ControlRouter.setupModule(.security)
    view?.navigationController?.pushViewController(vc, animated: true)
  }
}
