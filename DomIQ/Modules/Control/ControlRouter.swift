//
//  ControlRouter.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

final class ControlRouter {
  
  // MARK: Properties
  
  weak var view: UIViewController?
  
  // MARK: Static methods
  
  static func setupModule(_ control: Control) -> ControlViewController {
    let viewController = UIStoryboard(name: "Control",
    bundle: nil).instantiateViewController(identifier: "ControlVC") as! ControlViewController
    viewController.control = control
    let presenter = ControlPresenter()
    let router = ControlRouter()
    let interactor = ControlInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    
    return viewController
  }
}

extension ControlRouter: ControlWireframe {
  // TODO: Implement wireframe methods
}
