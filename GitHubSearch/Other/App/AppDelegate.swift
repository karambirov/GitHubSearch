//
//  AppDelegate.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 27/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityIndicator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarViewModel = TabBarViewModel(items: [.search, .favorites])
        window?.rootViewController = TabBarController(viewModel: tabBarViewModel)
        window?.makeKeyAndVisible()

        NetworkActivityIndicatorManager.shared.isEnabled = true

        return true
    }

}
