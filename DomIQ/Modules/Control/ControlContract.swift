//
//  ControlContract.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

protocol ControlView: class {
  func updateViewFromControl()
}

protocol ControlPresentation: class {
  func didTapControl()
}

protocol ControlUseCase: class {
  func didTappedControl()
}

protocol ControlInteractorOutput: class {
  func controlIsUpdated()
}

protocol ControlWireframe: class {
  // TODO: Declare wireframe methods
}
