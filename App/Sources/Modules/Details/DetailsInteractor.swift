//
//  DetailsInteractor.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol DetailsInteractorProtocol: AnyObject {

	func toggleFavorite(_ repository: Repository)
}

final class DetailsInteractor {

	private let repositoryDataProvider: RepositoryDataProvider

	init(repositoryDataProvider: RepositoryDataProvider) {
		self.repositoryDataProvider = repositoryDataProvider
	}
}

extension DetailsInteractor: DetailsInteractorProtocol {

	func toggleFavorite(_ repository: Repository) {
		repositoryDataProvider.toggleFavorite(repository)
	}
}
