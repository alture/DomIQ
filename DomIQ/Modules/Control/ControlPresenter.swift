//
//  ControlPresenter.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

final class ControlPresenter {
  
  // MARK: Properties
  
  weak var view: ControlView?
  var router: ControlWireframe?
  var interactor: ControlUseCase?
  
}

extension ControlPresenter: ControlPresentation {
  func didTapControl() {
    interactor?.didTappedControl()
  }
  
  // TODO: implement presentation methods
}

extension ControlPresenter: ControlInteractorOutput {
  func controlIsUpdated() {
    view?.updateViewFromControl()
  }
}
