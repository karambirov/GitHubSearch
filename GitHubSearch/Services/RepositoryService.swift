//
//  RepositoryService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class RepositoryService {

    private var networkService: NetworkService?
    private var realmService: RealmService?

    init(networkService: NetworkService = .init(), realmService: RealmService = .init()) {
        self.networkService = networkService
        self.realmService = realmService
    }

    func search(with query: String, completion: @escaping ([Repository]) -> Void) {
        networkService?.searchRepositories(with: query) { repositories in
            guard let repositories = repositories else { return }
            completion(repositories)
        }
    }

    @discardableResult
    func fetchFavorites() -> [Repository]? {
        let predicate = NSPredicate(format: "isFavorite = true")
        realmService?.fetch(Repository.self, predicate: predicate) { repositories in
            return repositories
        }
        return nil
    }

    func toggleFavorite(_ repository: Repository) {
        realmService?.update {
            repository.isFavorite.toggle()
        }
    }

}
