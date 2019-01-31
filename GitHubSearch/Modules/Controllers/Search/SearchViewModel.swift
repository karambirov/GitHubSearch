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
    var isLoading = false

    func searchRepositories(with query: String, completion: @escaping () -> Void) {
        isLoading = true
        repositoryService.searchRepositories(with: query) { [weak self] repositories in
            guard let self = self else { return }
            self.repositories = repositories
            DispatchQueue.main.async {
                self.isLoading = false
                completion()
            }
        }
    }

}
