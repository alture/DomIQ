//
//  CameraPresenter.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

final class CameraPresenter {
  
  // MARK: Properties
  
  weak var view: CameraView?
  var router: CameraWireframe?
  var interactor: CameraUseCase?
}

extension CameraPresenter: CameraPresentation {
  func didSelectItem(with url: String, title: String) {
    router?.showDetail(with: url, title: title)
  }
  
  func viewDidLoad() {
    interactor?.fetchCameras()
  }
  
  func didTapBack() {
    router?.showPreviousView()
  }
}

extension CameraPresenter: CameraInteractorOutput {
  func dataIsFetched(_ data: [Camera]) {
    view?.updateViewFromModel(data)
  }
}
