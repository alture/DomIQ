//
//  LoginViewController.swift
//  DomIQ
//
//  Created by Alisher on 5/17/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return false
  }
}


final class LoginViewController: UIViewController {
  
  @IBOutlet weak var topViewHeight: NSLayoutConstraint!
  @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
  // MARK: Properties
  @IBOutlet weak var loginTextField: UITextField! {
    didSet {
      loginTextField.delegate = self
    }
  }
  
  @IBOutlet weak var passwordTextField: UITextField! {
    didSet {
      passwordTextField.delegate = self
      passwordTextField.isSecureTextEntry = true
    }
  }
  
  @IBOutlet weak var loginButton: LoginButton! {
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
  
  @IBAction func didTapLoginButton(_ sender: UIButton) {
    loginButton.loading(true)
    presenter?.didTapLoginButton(with: loginTextField.text, passwordTextField.text)
  }
  
  var presenter: LoginPresentation?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidLayoutSubviews() {
    topViewHeight.constant = 60 + view.safeAreaInsets.top
    bottomViewHeight.constant = 80 + view.safeAreaInsets.bottom
  }
  
  // MARK: Private methods
  
  private func clearAllTextField() {
    self.loginTextField.text = ""
    self.passwordTextField.text = ""
  }
  
}

extension LoginViewController: LoginView {
  func handleError() {
    let alert = UIAlertController(title: "Неверный логин, или пароль", message: nil, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
    alert.addAction(alertAction)
    present(alert, animated: true) {
      self.loginButton.loading(false)
    }
  }
  
  func incorectError() {
    let alert = UIAlertController(title: "Пожалуйста, введите корректные значения", message: nil, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
    alert.addAction(alertAction)
    present(alert, animated: true) {
      self.loginButton.loading(false)
    }
  }
}
