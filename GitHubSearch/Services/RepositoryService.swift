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
    private var repositories: [Repository]

    init(networkService: NetworkService, repositories: [Repository] = [Repository]()) {
        self.networkService = networkService
        self.repositories = repositories
    }

    func searchRepositories(with query: String, completion: @escaping ([Repository]) -> Void) {
        networkService?.searchRepositories(with: query) { [weak self] repositories in
            guard let self = self, let repositories = repositories else { return }
            self.repositories += repositories
            completion(self.repositories)
        }
    }

}
