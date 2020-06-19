//
//  NavigationBar.swift
//  DomIQ
//
//  Created by Alisher on 6/3/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

protocol NavigationBarDelegate {
  func didTapExitButton()
}

@IBDesignable
class NavigationBar: UIView {
  
  var delegate: NavigationBarDelegate?
  
  @IBAction func didTapExitButton(_ sender: UIButton) {
    delegate?.didTapExitButton()
  }
    
  override func awakeFromNib() {
    super.awakeFromNib()
    
    initWithNib()
  }
  
  private func initWithNib() {
    Bundle.main.loadNibNamed("navigationBar", owner: self, options: nil)
  }
  /*
   // Only override draw() if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   override func draw(_ rect: CGRect) {
   // Drawing code
   }
   */
  
}
