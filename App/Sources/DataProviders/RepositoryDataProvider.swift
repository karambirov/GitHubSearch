//
//  RepositoryDataProvider.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class RepositoryDataProvider {

    private let networkingService: NetworkingServiceProtocol

    init(networkingService: NetworkingServiceProtocol) {
        self.networkingService = networkingService
    }

    func search(with query: String, completion: @escaping ([Repository]) -> Void) {
		networkingService.searchRepositories(with: query, completionHandler: completion)
    }

    func fetchFavorites(completion: @escaping ([Repository]) -> Void) {
//        let predicate = NSPredicate(format: "isFavorite = true")
//        let completion: ([Repository]) -> Void = { repositories in
//            completion(repositories.compactMap { $0.copy() as? Repository})
//        }
//        realmService.fetch(Repository.self, predicate: predicate, completion: completion)
    }

    func toggleFavorite(_ repository: Repository) {
//		repository.isFavorite.toggle()
//
//        repository.isFavorite
//            ? saveRepository(repository)
//            : deleteRepository(repository)
    }

	// FIXME: Поддержать сохранение и удаление в Storage
    func saveRepository(_ repository: Repository) {
//        if let newRepository = repository.copy() as? Repository {
//            realmService.save(newRepository)
//        }
    }

    func deleteRepository(_ repository: Repository) {
//        if let object = realmService.fetch(ofType: Repository.self, forPrimaryKey: repository.fullName) {
//            if let owner = object.owner {
//                realmService.delete(owner)
//            }
//            realmService.delete(object)
//        }
    }
}
