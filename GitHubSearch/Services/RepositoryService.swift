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

    func fetchFavorites(completion: @escaping ([Repository]) -> Void) {
        let predicate = NSPredicate(format: "isFavorite = true")
        realmService?.fetch(Repository.self, predicate: predicate) { repositories in
            completion(repositories)
        }
    }

    func toggleFavorite(_ repository: Repository) {
        realmService?.update {
            repository.isFavorite = !repository.isFavorite
        }
        
        if repository.isFavorite {
            self.realmService?.save(repository)
        } else {
            self.realmService?.delete(repository)
        }
    }
}
