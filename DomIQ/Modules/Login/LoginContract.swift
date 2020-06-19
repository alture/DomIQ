//
//  LoginContract.swift
//  DomIQ
//
//  Created by Alisher on 5/17/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

protocol LoginView: class {
  func handleError()
  func incorectError()
}

protocol LoginPresentation: class {
  func didTapLoginButton(with login: String?, _ password: String?)
}

protocol LoginUseCase: class {
  func didTappedLogin(with login: String, _ password: String)
}

protocol LoginInteractorOutput: class {
  func handleError()
  func incorectError()
  func sucessfully()
}

protocol LoginWireframe: class {
  func showMain()
}
