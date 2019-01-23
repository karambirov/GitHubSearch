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

    func searchRepositories(withQuery query: String) -> [Repository] {
        networkService?.searchRepositories(withQuery: query) { repositories in
            guard let repositories = repositories else {
                print("Failed in ", #file)
                return
            }
            self.repositories += repositories
        }
        return repositories
    }

}
