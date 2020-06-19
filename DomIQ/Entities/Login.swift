//
//  Login.swift
//  DomIQ
//
//  Created by Alisher on 5/17/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import Foundation
import ObjectMapper

final class Login: Mappable {
  var accessToken: String?
  var tokenType: String?
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    accessToken <- map["access_token"]
    tokenType <- map["token_type"]
  }
  

}

struct LoginError {
  let accessToken: String
  let tokenType: String
}
