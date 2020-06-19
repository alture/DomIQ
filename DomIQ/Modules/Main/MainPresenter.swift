//
//  MainPresenter.swift
//  DomIQ
//
//  Created by Alisher on 5/18/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

final class MainPresenter {
  
  // MARK: Properties
  
  weak var view: MainView?
  var router: MainWireframe?
  var interactor: MainUseCase?
}

extension MainPresenter: MainPresentation {
  func didTapItemAtIndex(_ index: Int) {
    switch index {
    case 0:
      router?.showCamera()
    case 1:
      router?.showSecurity()
    case 2:
      router?.showControl()
    default:
      break
    }
  }
  
  func didTapExitButton() {
    AcessToken.removeToken()
    router?.showLoginView()
  }
  
}

extension MainPresenter: MainInteractorOutput {
  // TODO: implement interactor output methods
}
