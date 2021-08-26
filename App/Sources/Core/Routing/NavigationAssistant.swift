//
//  NavigationAssistant.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

final class NavigationAssistant<NavigationDriver: NavigationDriverProtocol, Registry: NavigationItemsRegistryProtocol> where
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
extension NavigationAssistant {

	/// Возвращает тэг текущего экрана или nil, если у текущего экрана нет тэга.
	var currentTag: NavigationTag? { driver.currentTag }

	/// Возвращает индекс текущего экрана.
	var currentIndex: NavigationIndex { driver.currentIndex }

	/// Возвращает `true`, если экран с указанным тэгом есть в дереве навигации, и на него можно вернуться.
	/// Можно использовать для проверки наличия экрана перед вызовом `back(to:)`.
	func isReachable(_ tag: NavigationTag) -> Bool {
		driver.isReachable(tag)
	}

	/// Возвращает `true`, если экран с указанным тэгом есть в дереве навигации, или находится в процессе презентации
	/// и вскоре появится на экране.
	/// Можно использовать для избежания открытия нескольких экранов одновременно.
	func isPresented(_ tag: NavigationTag) -> Bool {
		driver.isPresented(tag)
	}
}

// MARK: - Forward
extension NavigationAssistant {

	/// Создает новый экран с соответствующим тэгом и открывает его.
	func forward<Parameters>(
		to tag: NavigationTag,
		with parameters: Parameters,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) {
		let _: Weak<Any>? = forward(to: tag, with: parameters, animated: animated, completion: completion)
	}

	/// Создает новый экран с соответствующим тэгом и открывает его.
	func forward(
		to tag: NavigationTag,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) {
		let _:Weak<Any>? = forward(to: tag, animated: animated, completion: completion)
	}

	/// Создает новый экран с соответствующим тэгом и открывает его.
	///
	/// Returns: Weak-контейнер с Input-ом экрана (обычно это Presenter).
	func forward<Parameters, Module>(
		to tag: NavigationTag,
		with parameters: Parameters,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) -> Weak<Module>? {

		let itemsResult = registry.makeItem(for: tag, with: parameters, module: Module.self)
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		return navigate(with: driver.forward, itemResult: itemsResult, animated: animated, completion: completionHandler)
	}

	/// Создает новый экран с соответствующим тэгом и открывает его.
	///
	/// Returns: Weak-контейнер с Input-ом экрана (обычно это Presenter).
	func forward<Module>(
		to tag: NavigationTag,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) -> Weak<Module>? {

		let itemsResult = registry.makeItem(for: tag, module: Module.self)
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		return navigate(with: driver.forward, itemResult: itemsResult, animated: animated, completion: completionHandler)
	}
}

// MARK: - Replace
extension NavigationAssistant {

	/// Создает новый экран с соответствующим тэгом и заменяет текущий на него.
	func replace<Parameters>(
		with tag: NavigationTag,
		parameters: Parameters,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) {
		let _: Weak<Any>? = replace(with: tag, parameters: parameters, animated: animated, completion: completion)
	}

	/// Создает новый экран с соответствующим тэгом и заменяет текущий на него.
	func replace(
		with tag: NavigationTag,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) {
		let _: Weak<Any>? = replace(with: tag, animated: animated, completion: completion)
	}

	/// Создает новый экран с соответствующим тэгом и заменяет текущий на него.
	///
	/// Returns: Weak-контейнер с Input-ом экрана (обычно это Presenter).
	func replace<Parameters, Module>(
		with tag: NavigationTag,
		parameters: Parameters,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) -> Weak<Module>? {

		let itemResult = registry.makeItem(for: tag, with: parameters, module: Module.self)
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		return navigate(with: driver.replace, itemResult: itemResult, animated: animated, completion: completionHandler)
	}

	/// Создает новый экран с соответствующим тэгом и заменяет текущий на него.
	///
	/// Returns: Weak-контейнер с Input-ом экрана (обычно это Presenter).
	func replace<Module>(
		with tag: NavigationTag,
		animated: Bool = true,
		completion: (() -> Void)? = nil
	) -> Weak<Module>? {

		let itemResult = registry.makeItem(for: tag, module: Module.self)
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		return navigate(with: driver.replace, itemResult: itemResult, animated: animated, completion: completionHandler)
	}
}

// MARK: - Back
extension NavigationAssistant {

	/// Возврат на один экран назад.
	func back(animated: Bool = true, completion: (() -> Void)? = nil) {
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		driver.back(animated: animated, completion: completionHandler)
	}

	/// Возврат к экрану с соответствующим тегом.
	func back(to tag: NavigationTag, animated: Bool = true, completion: (() -> Void)? = nil) {
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		driver.back(to: tag, animated: animated, completion: completionHandler)
	}

	/// Возврат на экран по индексу.
	func back(to index: NavigationIndex, animated: Bool = true, completion: (() -> Void)? = nil) {
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		driver.back(to: index, animated: animated, completion: completionHandler)
	}

	/// Переход назад с конкретного экрана. Полезно, когда надо перейти назад с экрана,
	/// не находящегося на вершине иерархии VC (например, если поверх экрана открыт UISearchController).
	func back(from tag: NavigationTag, animated: Bool = true, completion: (() -> Void)? = nil) {
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		driver.back(from: tag, animated: animated, completion: completionHandler)
	}

	/// Возврат к корню дерева (первому экрану).
	func backToRoot(animated: Bool = true, completion: (() -> Void)? = nil) {
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		driver.backToRoot(animated: animated, completion: completionHandler)
	}

	/// Переход на первый экран текущего UINavigationController-а.
	@available(*, deprecated,
		message: "Редко применим из-за возможной потери контроля над флоу. Используйте back(to: NavigationIndex).")
	func backToFlowRoot(animated: Bool = true, completion: (() -> Void)? = nil) {
		let completionHandler = makeCompletionWithErrorHandler(from: completion)
		driver.backToFlowRoot(animated: animated, completion: completionHandler)
	}
}

// MARK: - Private Helpers
private extension NavigationAssistant {

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

	func makeCompletionWithErrorHandler(from completion: (() -> Void)?) -> ((NavigationResult) -> Void) {
		return { result in
			switch result {
			case .failure(let error):
				assertionFailure(error.localizedDescription)
			case .success: break
			}

			completion?()
		}
	}
}
