//
//  RoutesRegistry.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

final class RoutesRegistry {

	private let registrar: NavigationRegistry
	private let modulesFactory: ModulesFactory

	init(registrar: NavigationRegistry, modulesFactory: ModulesFactory) {
		self.registrar = registrar
		self.modulesFactory = modulesFactory
	}
}
