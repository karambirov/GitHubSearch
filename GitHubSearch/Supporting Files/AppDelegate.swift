//
//  AppDelegate.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 16/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreDataService = CoreDataService(modelName: "GitHubSearch")


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setForFavorites(coreDataService: coreDataService)

        return true
    }




    // MARK: - Application's life cycle
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        coreDataService.saveContext()
    }

}


// MARK: - Private
private extension AppDelegate {

    func setForFavorites(coreDataService service: CoreDataService) {

        guard let tabBarController = window?.rootViewController as? UITabBarController,
            let favoritesNavigationController = tabBarController.viewControllers?[1] as? UINavigationController,
            let favoritesViewConroller = favoritesNavigationController.topViewController as? FavoritesViewController
            else { fatalError("Application storyboard mis-configuration. Application is mis-configured") }

    }

}

