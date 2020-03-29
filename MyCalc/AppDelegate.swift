//
//  AppDelegate.swift
//  MyCalc
//
//  Created by Geon Kang on 2020/02/12.
//  Copyright © 2020 Geon Kang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard.init(name: "main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MainViewController")
        
        let navigationController = UINavigationController()
        navigationController.setViewControllers([viewController], animated: false)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle



}

