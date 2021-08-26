//
//  DependencyContainer.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class Moya.MoyaProvider
import class UIKit.UIWindow
import class UIKit.UIScreen
import class UIKit.UIColor

final class DependencyContainer {
	lazy var window: UIWindow = {
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.backgroundColor = .systemBackground
		window.rootViewController = rootViewController
		return window
	}()

	lazy var rootViewController: RootViewController = {
		let rootViewContoller = RootViewController()
		rootViewContoller.rootViewController = modulesFactory.makeTabBarModule()
		return rootViewContoller
	}()

	lazy var gitHubApiProvider: MoyaProvider<GitHubAPI> = {
		MoyaProvider<GitHubAPI>()
	}()

	lazy var networkingService: NetworkingService = {
		NetworkingService(provider: gitHubApiProvider)
	}()

	lazy var repositoryDataProvider: RepositoryDataProvider = {
		RepositoryDataProvider(networkingService: networkingService)
	}()

	lazy var navigationRegistry: NavigationRegistry = {
		NavigationRegistry()
	}()

	lazy var navigationDriver: NavigationDriver = {
		NavigationDriver(rootHolder: rootViewController, debug: false)
	}()

	lazy var navigator: NavigationAssistant = {
		NavigationAssistant(driver: navigationDriver, registry: navigationRegistry)
	}()

	lazy var modulesFactory: ModulesFactory = {
		ModulesFactory(navigator: navigator, repositoryDataProvider: repositoryDataProvider)
	}()

	lazy var routesRegistry: RoutesRegistry = {
		RoutesRegistry(registrar: navigationRegistry, modulesFactory: modulesFactory)
	}()
}
