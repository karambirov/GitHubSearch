//
//  DependencyContainer.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class Moya.MoyaProvider

final class DependencyContainer {

	lazy var rootViewController: RootViewController = {
		let rootViewContoller = RootViewController()
		return rootViewContoller
	}()

	lazy var gitHubApiProvider: MoyaProvider<GitHubAPI> = {
		MoyaProvider<GitHubAPI>()
	}()

	lazy var networkingService: NetworkingServiceProtocol = {
		NetworkingService(provider: gitHubApiProvider)
	}()

	lazy var repositoryDataProvider: RepositoryDataProvider = {
		RepositoryDataProvider(networkingService: networkingService)
	}()

	lazy var navigationRegistry: NavigationRegistry = {
		NavigationRegistry()
	}()

	lazy var navigationDriver: NavigationDriver = {
		NavigationDriver(rootHolder: rootViewController, debug: false)
	}()

	lazy var navigator: NavigationAssistant = {
		NavigationAssistant(driver: navigationDriver, registry: navigationRegistry)
	}()

	lazy var modulesFactory: ModulesFactory = {
		ModulesFactory(navigator: navigator, repositoryDataProvider: repositoryDataProvider)
	}()

	lazy var routesRegistry: RoutesRegistry = {
		RoutesRegistry(registrar: navigationRegistry, modulesFactory: modulesFactory)
	}()
}
