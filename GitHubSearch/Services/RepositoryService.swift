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

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func searchRepositories(withQuery query: String,
                            completionHandler: @escaping (([Repository]?) -> Void)) {
        networkService?.searchRepositories(withQuery: query) { repositories in
            guard let repositories = repositories else { return }
            completionHandler(repositories)
        }
    }

}
