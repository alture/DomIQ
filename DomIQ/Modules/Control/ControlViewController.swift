//
//  ControlViewController.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

final class ControlViewController: UIViewController {
  
  // MARK: Properties
  
  var presenter: ControlPresentation?
  var control: Control = .control
  var isOn: Bool = false
  @IBOutlet weak var controlImageView: UIImageView! {
    didSet {
      controlImageView.isUserInteractionEnabled = true
      let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didPress(_:)))
      controlImageView.addGestureRecognizer(longPress)
    }
  }
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var statusImageView: UIImageView!
  @IBAction func didTapExitButton(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  @IBOutlet weak var navTitleLabel: UILabel!
  
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateControlView()
  }
  
  func updateControlView() {
    switch control {
    case .control:
      navTitleLabel.text = "Управление нагрузками"
      controlImageView.image = UIImage(named: isOn ? "control_on" : "control_off")
      titleLabel.text = isOn ? "Все включено" : "Все выключено"
      titleLabel.textColor = isOn ? #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
      statusImageView.image = UIImage(systemName: isOn ? "checkmark.circle.fill" : "power")
      statusImageView.tintColor = isOn ? #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    case .security:
      navTitleLabel.text = "Охрана"
      controlImageView.image = UIImage(named: isOn ? "security_on" : "security_off")
      titleLabel.text = isOn ? "Квартира под охраной" : "Квартира\nне охраняется"
      titleLabel.textColor = isOn ? #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
      statusImageView.image = UIImage(systemName: isOn ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
      statusImageView.tintColor = isOn ? #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
    }
  }
  
  @objc func didPress(_ sender: UILongPressGestureRecognizer) {
    if sender.state == .ended {
      presenter?.didTapControl()
      UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
  }
}

extension ControlViewController: ControlView {
  func updateViewFromControl() {
    isOn = !isOn
    updateControlView()
  }
}
