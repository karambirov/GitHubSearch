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
		let navigator: Navigator
		let repositoryDataProvider: RepositoryDataProvider
	}

	static func makeModule(dependencies: Dependencies) -> UIViewController {
		let router = SearchRouter(navigator: dependencies.navigator)
		let interactor = SearchInteractor(repositoryDataProvider: dependencies.repositoryDataProvider)
		let presenter = SearchPresenter(router: router, interactor: interactor)

		let viewController = SearchViewController(presenter: presenter)
		viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

		return viewController
	}
}
