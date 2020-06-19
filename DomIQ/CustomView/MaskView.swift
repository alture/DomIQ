//
//  MaskView.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

class MaskView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = frame
    gradientLayer.locations = [0.0, 1.1]
    gradientLayer.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 1.0), UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)]
    layer.insertSublayer(gradientLayer, at: 0)
  }
}
