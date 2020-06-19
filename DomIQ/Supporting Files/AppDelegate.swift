//
//  AppDelegate.swift
//  DomIQ
//
//  Created by Alisher on 5/16/20.
//  Copyright © 2020 Alisher. All rights reserved.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let navVC = UINavigationController()
    navVC.isNavigationBarHidden = true
    let token: Token = AcessToken.acessToken
    if token.isSucess == false {
      navVC.pushViewController(LoginRouter.setupModule(), animated: false)
    } else {
      navVC.pushViewController(MainRouter.setupModule(), animated: false)
    }
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window!.rootViewController = navVC
    window!.makeKeyAndVisible()
    
    MSAppCenter.start("6f496a46-b511-485f-b4c2-fb488a7c7c63", withServices:[
      MSAnalytics.self,
      MSCrashes.self
    ])
    return true
  }

  // MARK: UISceneSession Lifecycle

  @available(iOS 13.0, *)
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  @available(iOS 13.0, *)
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

