//
//  ModulesFactory.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit

final class ModulesFactory {

	private let navigator: Navigator
	private let repositoryDataProvider: RepositoryDataProvider

	init(
		navigator: Navigator,
		repositoryDataProvider: RepositoryDataProvider
	) {
		self.navigator = navigator
		self.repositoryDataProvider = repositoryDataProvider
	}
}

extension ModulesFactory {

	func makeTabBarModule() -> UIViewController {
		let tabBarController = UITabBarController()
		tabBarController.viewControllers = [
			makeSearchModule(),
			makeFavoritesModule()
		]
		return tabBarController
	}

	func makeSearchModule() -> UIViewController {
		let dependencies = SearchAssembly.Dependencies(
			navigator: navigator,
			repositoryDataProvider: repositoryDataProvider
		)
		let viewController = SearchAssembly.makeModule(dependencies: dependencies)
		return UINavigationController(rootViewController: viewController)
	}

	func makeFavoritesModule() -> UIViewController {
		let dependencies = FavoritesAssembly.Dependencies(
			navigator: navigator,
			repositoryDataProvider: repositoryDataProvider
		)
		let viewController = FavoritesAssembly.makeModule(dependencies: dependencies)
		return UINavigationController(rootViewController: viewController)
	}

	func makeDetailsModule(parameters: DetailsAssembly.Parameters) -> UIViewController {
		let dependencies = DetailsAssembly.Dependencies(
			navigator: navigator,
			repositoryDataProvider: repositoryDataProvider
		)
		return DetailsAssembly.makeModule(dependencies: dependencies, parameters: parameters)
	}
}
