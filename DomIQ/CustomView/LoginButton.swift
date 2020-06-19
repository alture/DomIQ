//
//  loginButton.swift
//  DomIQ
//
//  Created by Alisher on 5/18/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
  private var originalButtonText: String?
  
  private lazy var activityIndicator: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.color = .gray
    self.addSubview(view)
    
    NSLayoutConstraint.activate([
      view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      view.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
    
    return view
  }()
  
  func loading(_ isLoading: Bool) {
    isEnabled = !isLoading
    
    if isLoading {
      originalButtonText = currentTitle
      setTitle("", for: .normal)
      activityIndicator.startAnimating()
    } else {
      setTitle(originalButtonText, for: .normal)
      activityIndicator.stopAnimating()
    }
  }
}
