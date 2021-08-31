//
//  DetailsAssembly.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

enum DetailsAssembly {

	struct Dependencies {
		let navigator: Navigator
		let repositoryDataProvider: RepositoryDataProvider
	}

	struct Parameters {
		let repository: Repository
	}

	static func makeModule(dependencies: Dependencies, parameters: Parameters) -> UIViewController {
		let router = DetailsRouter(navigator: dependencies.navigator)
		let interactor = DetailsInteractor(repositoryDataProvider: dependencies.repositoryDataProvider)
		let presenter = DetailsPresenter(router: router, interactor: interactor, repository: parameters.repository)
		let viewController = DetailsViewController(presenter: presenter)
		viewController.navigationTag = Route.details.rawValue
		return viewController
	}
}
