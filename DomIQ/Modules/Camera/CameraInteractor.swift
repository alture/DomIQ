//
//  CameraInteractor.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import Alamofire
import UIKit
final class CameraInteractor {
  
  // MARK: Properties
  
  weak var output: CameraInteractorOutput?
}

extension CameraInteractor: CameraUseCase {  
  func fetchCameras() {
    let fullURL = API.baseAPI + "/client/camera"
    let userToken = AcessToken.acessToken
    let header = HTTPHeader(name: "Authorization", value: "Bearer \(userToken.text)")
    AF.request(fullURL, method: .get, encoding: URLEncoding.default, headers: [header]).validate().responseJSON { (response) in
      switch response.result {
      case .success(let value):
        guard
          let jsonObject = value as? [[String: Any]],
          let cameras = Camera.getArray(from: jsonObject)
        else {
          return
        }
        
        self.output?.dataIsFetched(cameras)
      case .failure(let error):
        print(error)
        return
      }
    }
  }
}
