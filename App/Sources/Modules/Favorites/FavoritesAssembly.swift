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
		let navigator: Navigator
		let repositoryDataProvider: RepositoryDataProvider
	}

	static func makeModule(dependencies: Dependencies) -> UIViewController {
		let router = FavoritesRouter(navigator: dependencies.navigator)
		let interactor = FavoritesInteractor(repositoryDataProvider: dependencies.repositoryDataProvider)
		let presenter = FavoritesPresenter(router: router, interactor: interactor)

		let viewController = FavoritesViewController(presenter: presenter)
		viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
		viewController.navigationTag = Route.favorites.rawValue

		return viewController
	}
}
