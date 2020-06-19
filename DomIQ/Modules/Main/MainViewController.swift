//
//  MainViewController.swift
//  DomIQ
//
//  Created by Alisher on 5/18/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
  
  // MARK: Properties
  @IBOutlet weak var collectionView: UICollectionView! {
    didSet {
      let layout = UICollectionViewFlowLayout()
      layout.minimumLineSpacing = 10.0
      layout.minimumInteritemSpacing = 10.0
      collectionView.collectionViewLayout = layout
    }
  }
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var weekLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!

  @IBAction func didTapExitButton(_ sender: UIButton) {
    let alertController = UIAlertController(title: "Вы уверены что хотите выйти?", message: nil, preferredStyle: .alert)
    let okAlertAction = UIAlertAction(title: "Ок", style: .default) { (_) in
      self.presenter?.didTapExitButton()
    }
    
    alertController.addAction(okAlertAction)
    
    let cancelAlertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
    alertController.addAction(cancelAlertAction)
    present(alertController, animated: true, completion: nil)
  }
  
  var collectionItemSize: CGSize {
    let numberOfItemsPerRow: CGFloat = 2
    let spacingBetweenCells: CGFloat = 10
    
    let totalSpacing = (numberOfItemsPerRow - 1) * spacingBetweenCells
    if let collection = collectionView {
        let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    } else {
        return CGSize(width: 0, height: 0)
    }
  }
  
  let services: [String] = [
    "camera",
    "security",
    "control",
    "counter",
    "services",
    "faq"
  ]
  
  var presenter: MainPresentation?
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector:#selector(calendarDayDidChange), name:NSNotification.Name.NSCalendarDayChanged, object:nil)
    calendarDayDidChange()
    Timer.scheduledTimer(timeInterval: 1.0, target: self,
    selector: #selector(calendarTimeDidChange), userInfo: nil, repeats: true)
    calendarTimeDidChange()
  }
  
  @objc func calendarTimeDidChange() {
    let date = Date()
    let calendar = Calendar.current
    
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    
    if minute < 10 {
      timeLabel.text = "\(hour):0\(minute)"
    } else {
      timeLabel.text = "\(hour):\(minute)"
    }
    
  }
  
  @objc func calendarDayDidChange() {
    let date = Date()
    let calendar = Calendar.current

    let weekday = calendar.component(.weekday, from: date)
    let day = calendar.component(.day, from: date)
    let month = calendar.component(.month, from: date)
    let year = calendar.component(.year, from: date)
    
    let weeks = [
      "Воскресенье",
      "Понедельник",
      "Вторник",
      "Среда",
      "Четверг",
      "Пятница",
      "Суббота"
    ]
    
    let months = [
      "Января",
      "Февраля",
      "Марта",
      "Апреля",
      "Мая",
      "Июня",
      "Июля",
      "Августа",
      "Сентября",
      "Октября",
      "Ноября",
      "Декабря"
    ]
    
    weekLabel.text = weeks[weekday-1]
    dateLabel.text = "\(day) \(months[month]), \(year)"
  }
}

extension MainViewController: MainView {
  // TODO: implement view output methods

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let numberOfItems = CGFloat(collectionView.numberOfItems(inSection: section)) / 2
    let combinedItemWidth = (numberOfItems * collectionItemSize.height) + (numberOfItems - 1) * 10
    let padding = (collectionView.bounds.height - combinedItemWidth) / 2
    return UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return collectionItemSize
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCell", for: indexPath) as! ServicesCollectionViewCell 
    cell.imgView.image = UIImage(named: services[indexPath.item])
    cell.imgView.highlightedImage = UIImage(named: services[indexPath.item] + "_h")
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.didTapItemAtIndex(indexPath.item)
  }
}
