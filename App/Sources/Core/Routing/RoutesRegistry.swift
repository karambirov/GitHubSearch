//
//  RoutesRegistry.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RoutesRegistry {

	private let registrar: NavigationRegistry
	private let modulesFactory: ModulesFactory

	init(registrar: NavigationRegistry, modulesFactory: ModulesFactory) {
		self.registrar = registrar
		self.modulesFactory = modulesFactory
	}

	func register() {
		self.registrar.register(.search) {
			let module = self.modulesFactory.makeSearchModule()
			let seed = self.makeSeed(with: module)
			return .item(seed: seed)
		}

		self.registrar.register(.favorites) {
			let module = self.modulesFactory.makeFavoritesModule()
			let seed = self.makeSeed(with: module)
			return .item(seed: seed)
		}

		self.registrar.register(.details) { (parameters: DetailsAssembly.Parameters) in
			let module = self.modulesFactory.makeDetailsModule(parameters: parameters)
			let seed = self.makeSeed(with: module, presentationStyle: .push)
			return .item(seed: seed)
		}
	}

}

private extension RoutesRegistry {

	func makeSeed(
		with viewController: UIViewController,
		presentationStyle: ViewControllerPresentationStyle = .modal(.fullScreen),
		navigationControllerBuilder: (() -> UINavigationController)? = nil
	) -> NavigationSeed {

		NavigationSeed(
			viewController: viewController,
			presentationStyle: presentationStyle,
			navigationControllerBuilder: navigationControllerBuilder
		)
	}
}
