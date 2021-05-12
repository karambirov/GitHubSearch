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
		let repositoryDataProvider: RepositoryDataProvider
	}

	struct Parameters {
		let repository: Repository
	}

	static func makeModule(dependencies: Dependencies, parameters: Parameters) -> UIViewController {
		let router = DetailsRouter()
		let viewModel = DetailsViewModel(
			repositoryDataProvider: dependencies.repositoryDataProvider,
			router: router,
			repository: parameters.repository
		)
		let viewController = DetailsViewController(viewModel: viewModel)
		return viewController
	}

}
