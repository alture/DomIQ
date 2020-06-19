//
//  CameraContract.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

protocol CameraView: class {
  func updateViewFromModel(_ model: [Camera])
}

protocol CameraPresentation: class {
  func didTapBack()
  func didSelectItem(with url: String, title: String)
  func viewDidLoad()
}

protocol CameraUseCase: class {
  func fetchCameras()
}

protocol CameraInteractorOutput: class {
  func dataIsFetched(_ data: [Camera])
}

protocol CameraWireframe: class {
  func showPreviousView()
  func showDetail(with url: String, title: String)
}
