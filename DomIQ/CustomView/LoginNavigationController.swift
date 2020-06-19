//
//  LoginNavigationController.swift
//  DomIQ
//
//  Created by Alisher on 5/18/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

class DomIQNavigationController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationBar.prefersLargeTitles = true
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.shadowImage = UIImage()
    navigationBar.backgroundColor = #colorLiteral(red: 0.2705882353, green: 0.1960784314, blue: 0.137254902, alpha: 0.8037243151)
    navigationBar.largeTitleTextAttributes = [
      NSAttributedString.Key.foregroundColor : UIColor.white,
      NSAttributedString.Key.font : UIFont.systemFont(ofSize: 28.0, weight: .regular)
    ]
    
  }
  
  override func viewDidLayoutSubviews() {
    navigationBar.frame = CGRect(x: 0,
                                 y: 0,
                                 width: navigationBar.bounds.width,
                                 height: 80.0)
  }
  
  
  
}
