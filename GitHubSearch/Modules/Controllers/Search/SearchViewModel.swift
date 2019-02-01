//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class SearchRouter: Router<SearchViewController>, SearchRouter.Routes {
    typealias Routes = DetailsRoute
}

final class SearchViewModel {

    // MARK: - Private
    private lazy var repositoryService = RepositoryService()

    // MARK: - Properties
    var repositories: [Repository]?
    var dataSource: TableViewDataSource<Repository, RepositoryCell>?
    let router: SearchRouter.Routes

    init(router: SearchRouter.Routes) {
        self.router = router
    }

    func searchRepositories(with query: String, completion: @escaping () -> Void) {
        repositoryService.searchRepositories(with: query) { [weak self] repositories in
            guard let self = self else { return }
            self.repositoriesDidLoad(repositories)
            DispatchQueue.main.async {
                completion()
            }
        }
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
