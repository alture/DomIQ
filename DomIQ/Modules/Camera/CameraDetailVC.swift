//
//  CameraDetailVC.swift
//  DomIQ
//
//  Created by Alisher on 5/26/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit
import MobileVLCKit

class CameraDetailVC: UIViewController, VLCMediaPlayerDelegate {
  
  private var mediaPlayer: VLCMediaPlayer = VLCMediaPlayer()
  private lazy var mediaView: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var mediaURL: URL? {
    didSet {
      guard let url = mediaURL else {
        return
      }
      
      let media = VLCMedia(url: url)
      mediaPlayer.media = media
      mediaPlayer.drawable = mediaView
      mediaPlayer.delegate = self
      mediaPlayer.play()
    }
  }
  
  var titleCamera: String?
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  @IBAction func didTapBackButton(_ sender: UIButton) {
    mediaPlayer.stop()
    navigationController?.popViewController(animated: true)
  }
  
  @IBOutlet weak var titleLabel: UILabel! {
    didSet {
      if let title = titleCamera {
        titleLabel.text = title
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(mediaView)
    
    NSLayoutConstraint.activate([
      mediaView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      mediaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mediaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mediaView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4, constant: 1)
    ])
  }
}
