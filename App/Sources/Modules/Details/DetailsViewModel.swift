//
//  DetailsViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class DetailsRouter: Router<DetailsViewController> {
    typealias Routes = Closable
}

final class DetailsViewModel {

	private let repositoryDataProvider: RepositoryDataProvider
    private let router: DetailsRouter.Routes
	private(set) var repository: Repository

    init(
		repositoryDataProvider: RepositoryDataProvider,
		router: DetailsRouter.Routes,
		repository: Repository
	) {
		self.repositoryDataProvider = repositoryDataProvider
        self.router = router
		self.repository = repository
    }

    func toggleFavorite() {
        repositoryDataProvider.toggleFavorite(repository)
    }
}
