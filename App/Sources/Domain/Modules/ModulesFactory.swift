//
//  ModulesFactory.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit

final class ModulesFactory {

	func makeRootModule() -> UIViewController {
		let parameters = RootAssembly.Parameters(
			tabBarController: makeTabBarController()
		)
		return RootAssembly.makeModule(parameters: parameters)
	}

	func makeSearchModule() -> UIViewController {
		let router = SearchRouter()
		let viewModel = SearchViewModel(router: router)
		let viewController = SearchViewController(viewModel: viewModel)
		viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
		router.viewController = viewController
		return UINavigationController(rootViewController: viewController)
	}

	func makeFavoritesModule() -> UIViewController {
		let router = FavoritesRouter()
		let viewModel = FavoritesViewModel(router: router)
		let viewController = FavoritesViewController(viewModel: viewModel)
		viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
		router.viewController = viewController
		return UINavigationController(rootViewController: viewController)
	}
}

private extension ModulesFactory {

	func makeTabBarController() -> UITabBarController {
		let tabBarController = UITabBarController()
		tabBarController.viewControllers = [
			makeSearchModule(),
			makeFavoritesModule()
		]
		return tabBarController
	}
}
