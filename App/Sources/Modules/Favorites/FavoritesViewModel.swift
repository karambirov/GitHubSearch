//
//  FavoritesViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class FavoritesViewModel {

	private let repositoryDataProvider: RepositoryDataProvider

    var favoriteRepositories: [Repository]?
    var dataSource: TableViewDataSource<Repository, RepositoryCell>?

    init(repositoryDataProvider: RepositoryDataProvider) {
		self.repositoryDataProvider = repositoryDataProvider
    }

    func fetchFavoriteRepositories(_ completion: @escaping () -> Void) {
        repositoryDataProvider.fetchFavorites { [weak self] repositories in
            self?.repositoriesDidLoad(repositories)
			completion()
        }
    }

    func repository(for indexPath: IndexPath) -> Repository? {
        guard let repository = favoriteRepositories?[indexPath.row] else { return nil }
        return repository
    }

    private func repositoriesDidLoad(_ repositories: [Repository]) {
        self.favoriteRepositories = repositories
        dataSource = .make(for: favoriteRepositories!)
    }
}
