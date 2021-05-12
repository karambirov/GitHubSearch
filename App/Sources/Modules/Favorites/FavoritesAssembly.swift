//
//  FavoritesAssembly.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

enum FavoritesAssembly {

	struct Dependencies {
		let repositoryDataProvider: RepositoryDataProvider
	}

	static func makeModule(dependencies: Dependencies) -> UIViewController {
		let router = FavoritesRouter()

		let viewModel = FavoritesViewModel(
			repositoryDataProvider: dependencies.repositoryDataProvider,
			router: router
		)

		let viewController = FavoritesViewController(viewModel: viewModel)
		viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

		router.viewController = viewController

		return viewController
	}
}
