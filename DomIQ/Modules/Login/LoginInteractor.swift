//
//  LoginInteractor.swift
//  DomIQ
//
//  Created by Alisher on 5/17/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import Alamofire
import SwiftKeychainWrapper
import Foundation


final class LoginInteractor {
  
  // MARK: Properties
  
  var output: LoginInteractorOutput?
}

extension LoginInteractor: LoginUseCase {
  func didTappedLogin(with login: String, _ password: String) {
    let fullURL = API.baseAPI + "/login/access-token"
    let params: Parameters = [
      "username": login,
      "password": password,
      "scope": "person"
    ]
    
    AF.request(fullURL, method: .post, parameters: params, encoding: URLEncoding.default).validate().responseJSON { (response) in
      switch response.result {
      case .success(let value):
          guard
              let jsonObject = value as? [String: Any],
              let login = Login(JSON: jsonObject)
          else {
            return
          }
          
          if let accessToken = login.accessToken,
             KeychainWrapper.standard.set(accessToken, forKey: "UserID") {
            self.output?.sucessfully()
          }

      case .failure(_):
        switch response.response?.statusCode {
        case 422:
          self.output?.incorectError()
        default:
          self.output?.handleError()
        }
      }
    }
  }
}
