//
//  FavoritesInteractor.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol FavoritesInteractorProtocol: AnyObject {
}

final class FavoritesInteractor {

	private let repositoryDataProvider: RepositoryDataProvider

	init(repositoryDataProvider: RepositoryDataProvider) {
		self.repositoryDataProvider = repositoryDataProvider
	}
}

extension FavoritesInteractor: FavoritesInteractorProtocol { }
