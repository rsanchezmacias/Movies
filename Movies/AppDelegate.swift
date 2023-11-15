//
//  AppDelegate.swift
//  Movies
//
//  Created by Ricardo Sanchez-Macias on 11/15/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainViewControllerStoryboard = UIStoryboard(name: MainViewController.storyboardName, bundle: nil)
        let mainViewController = mainViewControllerStoryboard.instantiateViewController(withIdentifier: MainViewController.identifier)
        let rootViewController = UINavigationController(rootViewController: mainViewController)
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

