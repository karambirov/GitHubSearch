//
//  FavoritesViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class FavoritesRouter: Router<FavoritesViewController>, FavoritesRouter.Routes {
    typealias Routes = DetailsRoute
}

final class FavoritesViewModel {

    // MARK: - Private
    private let repositoryService = RepositoryService()

    // MARK: - Properties
    var repositories: [Repository]?
    var dataSource: TableViewDataSource<Repository, RepositoryCell>?
    let router: FavoritesRouter.Routes

    init(router: FavoritesRouter.Routes) {
        self.router = router
    }

    // MARK: - Methods
    func repository(for indexPath: IndexPath) -> Repository? {
        guard let repository = repositories?[indexPath.row] else { return nil }
        return repository
    }

    func deleteLoadedRepositories() {
        self.repositories?.removeAll()
        guard let repositories = repositories else { return }
        dataSource = .make(for: repositories)
    }

    private func repositoriesDidLoad(_ repositories: [Repository]) {
        self.repositories = repositories
        dataSource = .make(for: repositories)
    }

}
