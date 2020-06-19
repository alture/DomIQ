//
//  CameraRouter.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

final class CameraRouter {
  
  // MARK: Properties
  
  weak var view: UIViewController?
  
  // MARK: Static methods
  
  static func setupModule() -> CameraViewController {
    let viewController = UIStoryboard(name: "Camera", bundle: nil).instantiateViewController(identifier: "CameraVC") as! CameraViewController
    let presenter = CameraPresenter()
    let router = CameraRouter()
    let interactor = CameraInteractor()
    
    viewController.presenter =  presenter
    
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    
    router.view = viewController
    
    interactor.output = presenter
    
    return viewController
  }
}

extension CameraRouter: CameraWireframe {
  func showDetail(with url: String, title: String) {
    let viewController = UIStoryboard(name: "Camera", bundle: nil).instantiateViewController(identifier: "CameraDetailVC") as! CameraDetailVC
    viewController.mediaURL = URL(string: url)
    viewController.titleCamera = title
    view?.navigationController?.pushViewController(viewController, animated: true)
  }
  
  func showPreviousView() {
    view?.navigationController?.popViewController(animated: true)
  }
}
