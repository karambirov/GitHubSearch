//
//  SearchViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class SearchViewModel {

    // MARK: - Private
    private let networkService = NetworkService()
    private lazy var repositoryService = RepositoryService(networkService: networkService)

    // MARK: - Properties
    var repositories = [Repository]()

    func searchRepositories(withQuery query: String, completion: @escaping () -> Void) {
//        repositories = repositoryService.searchRepositories(withQuery: query)
        networkService.searchRepositories(withQuery: query) { repos in
            guard let repos = repos else {
                print("Failed in ", #file)
                return
            }
            DispatchQueue.main.async {
                self.repositories.append(contentsOf: repos)
                completion()
                print("Repositories: ", self.repositories.count)
            }
        }
    }
}
