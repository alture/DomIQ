//
//  Constants.swift
//  DomIQ
//
//  Created by Alisher on 5/17/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

enum API {
  static let baseAPI: String = "https://ud5.2242000.ru/api/v1"
}

typealias Token = (isSucess: Bool, text: String)

enum AcessToken {
  static var acessToken: Token {
    if let token = KeychainWrapper.standard.string(forKey: "UserID") {
      return (true, token)
    } else {
      return (false, "")
    }
      
  }
  
  static func removeToken() {
    KeychainWrapper.standard.removeObject(forKey: "UserID")
  }
}

