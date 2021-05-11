//
//  SearchAssembly.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

enum SearchAssembly {

	struct Dependencies {
		let repositoryDataProvider: RepositoryDataProvider
	}

	static func makeModule(dependencies: Dependencies) -> UIViewController {
		let router = SearchRouter()

		let viewModel = SearchViewModel(
			repositoryDataProvider: dependencies.repositoryDataProvider,
			router: router
		)

		let viewController = SearchViewController(viewModel: viewModel)
		viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

		router.viewController = viewController

		return viewController
	}
}
