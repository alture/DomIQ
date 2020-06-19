//
//  ViewController.swift
//  DomIQ
//
//  Created by Alisher on 5/16/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var loginTextField: UITextField! {
    didSet {
      
    }
  }
  
  @IBOutlet weak var passwordTextField: UITextField! {
    didSet {
      passwordTextField.isSecureTextEntry = true
    }
  }
  
  @IBOutlet weak var loginButton: UIButton!{
    didSet {
      let gradient = CAGradientLayer()
      let colorTop = #colorLiteral(red: 0.3137254902, green: 0.262745098, blue: 0.1960784314, alpha: 1)
      let colorBottom = #colorLiteral(red: 0.1803921569, green: 0.1411764706, blue: 0.1058823529, alpha: 1)
      
      gradient.colors = [colorTop, colorBottom]
      gradient.locations = [0.0, 1.0]
      gradient.frame = loginButton.frame
      loginButton.layer.insertSublayer(gradient, at: 0)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func didTapLoginButton(_ sender: UIButton) {
    
  }
  

}

