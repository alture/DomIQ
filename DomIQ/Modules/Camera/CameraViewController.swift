//
//  CameraViewController.swift
//  DomIQ
//
//  Created by Alisher on 5/19/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit
import MobileVLCKit

final class CameraViewController: UIViewController, VLCMediaPlayerDelegate {
  
  private var cameras: [Camera] = [] {
    didSet {
      collectionView.reloadData()
    }
  }
    
  // MARK: Properties
  @IBOutlet weak var collectionView: UICollectionView! {
    didSet {
      collectionView.isHidden = true
    }
  }
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var presenter: CameraPresentation?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  @IBAction func didTapBackButton(_ sender: UIButton) {
    presenter?.didTapBack()
  }
}

extension CameraViewController: CameraView {
  func updateViewFromModel(_ model: [Camera]) {
    cameras = model
    if model.count > 0 {
      collectionView.isHidden = false
      activityIndicator.stopAnimating()
    }
  }
  
}

extension CameraViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = view.frame.width / 2 - 38
    return CGSize(width: width, height: 100)
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cameras.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCell", for: indexPath) as! CameraCollectionViewCell
    cell.number.text = "\(indexPath.item + 1)"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let camera = cameras[indexPath.item]
    
    if let url = camera.name {
      presenter?.didSelectItem(with: url, title: "Камера \(indexPath.item + 1)")
    }
  }
  
}

