//
//  MainContract.swift
//  DomIQ
//
//  Created by Alisher on 5/18/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

protocol MainView: class {
  // TODO: Declare view methods
}

protocol MainPresentation: class {
  func didTapItemAtIndex(_ index: Int)
  func didTapExitButton()
}

protocol MainUseCase: class {
  // TODO: Declare use case methods
}

protocol MainInteractorOutput: class {
  // TODO: Declare interactor output methods
}

protocol MainWireframe: class {
  func showCamera()
  func showLoginView()
  func showControl()
  func showSecurity()
}
