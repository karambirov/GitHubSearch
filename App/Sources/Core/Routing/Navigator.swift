//
//  Navigator.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

final class Navigator<NavigationDriver: NavigationDriverProtocol, Registry: NavigationItemsRegistryProtocol> where
	NavigationDriver.NavigationTag == Registry.NavigationTag,
	NavigationDriver.NavigationSeed == Registry.NavigationSeed {

	typealias NavigationSeed = NavigationDriver.NavigationSeed
	typealias NavigationTag = NavigationDriver.NavigationTag

	private let driver: NavigationDriver
	private let registry: Registry

	init(driver: NavigationDriver, registry: Registry) {
		self.driver = driver
		self.registry = registry
	}
}

// MARK: - Checks
extension Navigator {

	var currentTag: NavigationTag? { driver.currentTag }
	var currentIndex: NavigationIndex { driver.currentIndex }

	func isReachable(_ tag: NavigationTag) -> Bool {
		driver.isReachable(tag)
	}

	func isPresented(_ tag: NavigationTag) -> Bool {
		driver.isPresented(tag)
	}
}

// MARK: - Forward
extension Navigator {

	func forward<Parameters>(
		to tag: NavigationTag,
		with parameters: Parameters,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) {
		let _: Weak<Any>? = forward(to: tag, with: parameters, animated: animated, completion: completion)
	}

	func forward(
		to tag: NavigationTag,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) {
		let _:Weak<Any>? = forward(to: tag, animated: animated, completion: completion)
	}

	func forward<Parameters, Module>(
		to tag: NavigationTag,
		with parameters: Parameters,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) -> Weak<Module>? {

		let itemsResult = registry.makeItem(for: tag, with: parameters, module: Module.self)
		return navigate(with: driver.forward, itemResult: itemsResult, animated: animated, completion: completion)
	}

	func forward<Module>(
		to tag: NavigationTag,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) -> Weak<Module>? {

		let itemsResult = registry.makeItem(for: tag, module: Module.self)
		return navigate(with: driver.forward, itemResult: itemsResult, animated: animated, completion: completion)
	}
}

// MARK: - Replace
extension Navigator {

	func replace<Parameters>(
		with tag: NavigationTag,
		parameters: Parameters,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) {
		let _: Weak<Any>? = replace(with: tag, parameters: parameters, animated: animated, completion: completion)
	}

	func replace(
		with tag: NavigationTag,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) {
		let _: Weak<Any>? = replace(with: tag, animated: animated, completion: completion)
	}

	func replace<Parameters, Module>(
		with tag: NavigationTag,
		parameters: Parameters,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) -> Weak<Module>? {

		let itemResult = registry.makeItem(for: tag, with: parameters, module: Module.self)
		return navigate(with: driver.replace, itemResult: itemResult, animated: animated, completion: completion)
	}

	func replace<Module>(
		with tag: NavigationTag,
		animated: Bool = true,
		completion: @escaping NavigationCompletion
	) -> Weak<Module>? {

		let itemResult = registry.makeItem(for: tag, module: Module.self)
		return navigate(with: driver.replace, itemResult: itemResult, animated: animated, completion: completion)
	}
}

// MARK: - Back
extension Navigator {
	func back(animated: Bool = true, completion: @escaping NavigationCompletion) {
		driver.back(animated: animated, completion: completion)
	}

	func back(to tag: NavigationTag, animated: Bool = true, completion: @escaping NavigationCompletion) {
		driver.back(to: tag, animated: animated, completion: completion)
	}

	func back(to index: NavigationIndex, animated: Bool = true, completion: @escaping NavigationCompletion) {
		driver.back(to: index, animated: animated, completion: completion)
	}

	func back(from tag: NavigationTag, animated: Bool = true, completion: @escaping NavigationCompletion) {
		driver.back(from: tag, animated: animated, completion: completion)
	}

	func backToRoot(animated: Bool = true, completion: @escaping NavigationCompletion) {
		driver.backToRoot(animated: animated, completion: completion)
	}

	func backToFlowRoot(animated: Bool = true, completion: @escaping NavigationCompletion) {
		driver.backToFlowRoot(animated: animated, completion: completion)
	}
}

// MARK: - Private Helpers
private extension Navigator {

	typealias NavigationMethod =
		(_ seed: NavigationSeed, _ animated: Bool, _ completion: @escaping NavigationCompletion) -> Void

	func navigate<Module>(
		with method: NavigationMethod,
		itemResult: RegistryResult<NavigationSeed, Module>?,
		animated: Bool,
		completion: @escaping NavigationCompletion
	) -> Weak<Module>? {

		switch itemResult {
		case .success(let item):
			method(item.seed, animated, completion)
			return Weak(value: item.module)
		case .failure(let registryError):
			completion(.failure(.registryError(registryError)))
			return nil
		case .none:
			completion(.success(.noOperation))
			return nil
		}
	}
}
