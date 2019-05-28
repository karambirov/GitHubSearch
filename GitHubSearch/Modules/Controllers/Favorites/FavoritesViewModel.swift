//
//  FavoritesViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import RealmSwift

final class FavoritesRouter: Router<FavoritesViewController>, FavoritesRouter.Routes {
    typealias Routes = DetailsRoute
}

final class FavoritesViewModel {

    // MARK: - Private
    private let repositoryService = RepositoryService()

    // MARK: - Properties
    var favoriteRepositories: [Repository]?
    var dataSource: TableViewDataSource<Repository, RepositoryCell>?
    let router: FavoritesRouter.Routes

    init(router: FavoritesRouter.Routes) {
        self.router = router
    }

    // MARK: - Methods

    // FIXME: - Table stays empty after fetching
    func fetchFavoriteRepositories(_ completion: @escaping () -> Void) {
        let realmService = RealmService()
        realmService.fetch(Repository.self, completion: { (repositories) in
            self.favoriteRepositories = repositories
            DispatchQueue.main.async {
                self.repositoriesDidLoad(self.favoriteRepositories!)
                completion()
            }
        })

        repositoryService.fetchFavorites { [weak self] repositories in
            guard let self = self else { return }

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
