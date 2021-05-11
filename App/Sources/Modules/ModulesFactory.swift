//
//  ModulesFactory.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit

final class ModulesFactory {

	private let dependencyContainer: DependencyContainer

	init(dependencyContainer: DependencyContainer) {
		self.dependencyContainer = dependencyContainer
	}
}

extension ModulesFactory {

	func makeRootModule() -> UIViewController {
		let tabBarController = UITabBarController()
		tabBarController.viewControllers = [
			makeSearchModule(),
			makeFavoritesModule()
		]
		let parameters = RootAssembly.Parameters(tabBarController: tabBarController)
		return RootAssembly.makeModule(parameters: parameters)
	}

	func makeSearchModule() -> UIViewController {
		let dependencies = SearchAssembly.Dependencies(
			repositoryDataProvider: dependencyContainer.repositoryDataProvider
		)
		let viewController = SearchAssembly.makeModule(dependencies: dependencies)
		return UINavigationController(rootViewController: viewController)
	}

	func makeFavoritesModule() -> UIViewController {
		let dependencies = FavoritesAssembly.Dependencies(
			repositoryDataProvider: dependencyContainer.repositoryDataProvider
		)
		let viewController = FavoritesAssembly.makeModule(dependencies: dependencies)
		return UINavigationController(rootViewController: viewController)
	}

	func makeDetailsModule(parameters: DetailsAssembly.Parameters) -> UIViewController {
		let dependencies = DetailsAssembly.Dependencies(
			repositoryDataProvider: dependencyContainer.repositoryDataProvider
		)
		return DetailsAssembly.makeModule(dependencies: dependencies, parameters: parameters)
	}
}
