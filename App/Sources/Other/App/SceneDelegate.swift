//
//  SceneDelegate.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	lazy var dependencyContainer = DependencyContainer()

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let rootViewController = dependencyContainer.rootViewController
		rootViewController.rootViewController = dependencyContainer.modulesFactory.makeTabBarModule()

		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = rootViewController

		dependencyContainer.routesRegistry.register()

		window?.makeKeyAndVisible()
	}
}
