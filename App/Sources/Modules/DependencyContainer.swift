//
//  DependencyContainer.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class Moya.MoyaProvider
import RealmSwift

final class DependencyContainer {

	lazy var networkingService: NetworkingService = {
		let provider = MoyaProvider<GitHubAPI>()
		return NetworkingService(provider: provider)
	}()

	lazy var realmService: RealmService = {
		let config = Realm.Configuration(schemaVersion: 1)
		return RealmService(config: config)
	}()

	lazy var repositoryDataProvider: RepositoryDataProvider = {
		RepositoryDataProvider(
			networkingService: self.networkingService,
			realmService: self.realmService
		)
	}()
}
