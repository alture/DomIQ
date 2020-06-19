//
//  Camera.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import Foundation
import ObjectMapper

class Camera: Mappable {
  var id: Int?
  var mac: String?
  var ip: String?
  var descr: String?
  var name: String?
  var button: String?
  
  required init?(map: Map) {}
  
  func mapping(map: Map) {
    id <- map["id"]
    mac <- map["mac"]
    ip <- map["ip"]
    descr <- map["descr"]
    name <- map["name"]
    button <- map["button"]
  }
  
  static func getArray(from jsonArray: Any) -> [Camera]? {
      guard let jsonArray = jsonArray as? Array<[String: Any]> else {
        return nil
      }
    
      var cameras: [Camera] = []
      for jsonObject in jsonArray {
        if let camera = Camera(JSON: jsonObject) {
              cameras.append(camera)
        }
      }
    
      return cameras
  }
  
}
