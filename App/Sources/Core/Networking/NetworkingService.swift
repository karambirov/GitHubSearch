//
//  NetworkService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import Moya

protocol NetworkingServiceProtocol {

	func searchRepositories(with query: String, completionHandler: @escaping ([Repository]) -> Void)
}

final class NetworkingService {

    private let provider: MoyaProvider<GitHubAPI>

    init(provider: MoyaProvider<GitHubAPI>) {
        self.provider = provider
    }
}

extension NetworkingService: NetworkingServiceProtocol {

    func searchRepositories(
		with query: String,
		completionHandler: @escaping ([Repository]) -> Void
	) {

        provider.request(.searchRepo(query: query)) { result in
            switch result {
            case .success(let response):
                do {
					let repositories = try response.map(SearchResults<Repository>.self).items
					DispatchQueue.main.async {
						completionHandler(repositories)
					}
                } catch {
					DispatchQueue.main.async {
						print(error.localizedDescription)
					}
                }

            case .failure(let error):
				DispatchQueue.main.async {
					print(error)
				}
            }
        }
    }
}
