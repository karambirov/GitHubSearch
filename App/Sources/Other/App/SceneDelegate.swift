//
//  SceneDelegate.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityIndicator

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	lazy var modulesFactory = ModulesFactory()

	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = modulesFactory.makeRootModule()
		window?.makeKeyAndVisible()

		NetworkActivityIndicatorManager.shared.isEnabled = true
	}
}