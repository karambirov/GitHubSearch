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
        repositoryService.searchRepositories(withQuery: query) { [weak self] repositories in
            guard let self = self else { return }
            self.repositories = repositories
            print(3)
            completion()
        }
    }

}
