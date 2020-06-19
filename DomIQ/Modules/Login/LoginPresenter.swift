//
//  LoginPresenter.swift
//  DomIQ
//
//  Created by Alisher on 5/17/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

final class LoginPresenter {
  
  // MARK: Properties
  
  weak var view: LoginView?
  var router: LoginWireframe?
  var interactor: LoginUseCase?
}

extension LoginPresenter: LoginPresentation {
  func didTapLoginButton(with login: String?, _ password: String?) {
    guard
      let login = login,
      let password = password
    else {
      view?.incorectError()
      return
    }
    
    interactor?.didTappedLogin(with: login, password)
  }
}

extension LoginPresenter: LoginInteractorOutput {
  func handleError() {
    view?.handleError()
  }
  
  func incorectError() {
    view?.incorectError()
  }
  
  func sucessfully() {
    router?.showMain()
  }
}
