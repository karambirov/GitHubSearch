//
//  SearchInteractor.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol SearchInteractorProtocol: AnyObject {

	func searchRepositories(
		with query: String,
		completion: @escaping ([Repository]) -> Void
	)
}

final class SearchInteractor {

	private let repositoryDataProvider: RepositoryDataProvider

	init(repositoryDataProvider: RepositoryDataProvider) {
		self.repositoryDataProvider = repositoryDataProvider
	}
}

extension SearchInteractor: SearchInteractorProtocol {

	func searchRepositories(with query: String, completion: @escaping ([Repository]) -> Void) {
		repositoryDataProvider.search(with: query, completion: completion)
	}
}
