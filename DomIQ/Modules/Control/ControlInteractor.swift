//
//  ControlInteractor.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

final class ControlInteractor {
  
  // MARK: Properties
  
  weak var output: ControlInteractorOutput?
}

extension ControlInteractor: ControlUseCase {
  func didTappedControl() {
    // TODO: - Request
    output?.controlIsUpdated()
  }
}
