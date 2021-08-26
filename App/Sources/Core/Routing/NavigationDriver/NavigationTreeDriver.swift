//
//  NavigationTreeDriver.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UITabBarController

protocol NavigationTreeDriverDelegate: AnyObject {

	func didShow(_: NavigationSeed)
}

final class NavigationTreeDriver<NavigationTag: NavigationTagProtocol> {

	weak var delegate: NavigationTreeDriverDelegate?

	private lazy var treeBuilder = ViewControllerTreeBuilder(rootHolder: self.rootHolder)

	private var appearingTagValues = Set<String>()

	private let rootHolder: RootViewControllerHolder
	private let debug: Bool

	init(rootHolder: RootViewControllerHolder, debug: Bool = false) {
		self.rootHolder = rootHolder
		self.debug = debug
	}
}

extension NavigationTreeDriver: NavigationDriverProtocol {

	var currentTag: NavigationTag? {
		tag(for: capture().stack.topViewController)
	}

	var currentIndex: NavigationIndex {
		let index = max(0, capture().stack.length - 1)
		return NavigationIndex(value: index)
	}

	func isReachable(_ tag: NavigationTag) -> Bool {
		capture().tree?.contains { self.tag(for: $0) == tag } ?? false
	}

	func isPresented(_ tag: NavigationTag) -> Bool {
		isReachable(tag) || isAppearing(tag)
	}

	func forward(to seed: NavigationSeed, animated: Bool, completion: @escaping NavigationCompletion) {
		captureAppearingTag(seed.navigationTagHolder.navigationTag)

		let state = capture()
		let completion = wrap(completion, seed: seed)

		guard state.stack.length > 0 else {
			replaceRoot(with: seed, completion: completion)
			return
		}

		state.stack.forward(
			to: seed.makeViewController(),
			with: seed.presentationStyle,
			animated: animated,
			completion: completion
		)
	}

	func replace(with seed: NavigationSeed, animated: Bool, completion: @escaping NavigationCompletion) {
		self.captureAppearingTag(seed.navigationTagHolder.navigationTag)

		let state = capture()
		let completion = wrap(completion, seed: seed)

		guard state.stack.length > 1 else {
			replaceRoot(with: seed, completion: completion)
			return
		}

		let presentationStyle = state.stack.topPresentationStyle ?? seed.presentationStyle

		state.stack.back(animated: false) { _ in
			self.capture().stack.forward(
				to: seed.makeViewController(for: presentationStyle),
				with: presentationStyle,
				animated: animated,
				completion: completion
			)
		}
	}

	func back(animated: Bool, completion: @escaping NavigationCompletion) {
		capture().stack.back(animated: animated, completion: completion)
	}

	func back(to tag: NavigationTag, animated: Bool, completion: @escaping NavigationCompletion) {
		back(to: tag, offset: 0, animated: animated, completion: completion)
	}

	func back(from tag: NavigationTag, animated: Bool, completion: @escaping NavigationCompletion) {
		back(to: tag, offset: -1, animated: animated, completion: completion)
	}

	func back(to index: NavigationIndex, animated: Bool, completion: @escaping NavigationCompletion) {
		capture().stack.back(to: index.value, animated: animated, completion: completion)
	}

	func backToRoot(animated: Bool, completion: @escaping NavigationCompletion) {
		capture().stack.back(to: 0, animated: animated, completion: completion)
	}

	func backToFlowRoot(animated: Bool, completion: @escaping NavigationCompletion) {
		capture().stack.backToFlowRoot(animated: animated, completion: completion)
	}
}

private extension NavigationTreeDriver {

	final class State {

		let tree: Tree<UIViewController>?
		let stack: NavigationStack

		init(tree: Tree<UIViewController>?, stack: [UIViewController]) {
			self.tree = tree
			self.stack = NavigationStack(stack: stack)
		}
	}

	func capture() -> State {
		let tree = treeBuilder.build()
		let stack = tree?.selectedBranch ?? []
		let state = State(tree: tree, stack: stack)

		if debug {
			print("🧭 TREE:\n")
			print(tree?.debugDescription ?? "empty")
			print()

			print("🧭 STACK:\n")
			print("[ " + stack.map { tag(for: $0)?.value ?? "nil" }.joined(separator: " -> ") + " ]")
			print()

			let currentTag = tag(for: state.stack.topViewController)?.value ?? "nil"
			print("🧭 CURRENT TAG: \(currentTag)")
			print()
		}

		return state
	}

	func replaceRoot(with seed: NavigationSeed, completion: NavigationCompletion?) {
		rootHolder.rootViewController = seed.makeViewController(for: .modal(.fullScreen))
		completion?(.success)
	}

	func tag(for viewController: UIViewController?) -> NavigationTag? {
		guard let navigationTag = viewController?.navigationTag else { return nil }
		return NavigationTag(value: navigationTag)
	}

	func switchTabBarControllers(on path: [Tree<UIViewController>.PathNode]) {
		for case .switch(let viewController, let index) in path {
			(viewController as? UITabBarController)?.selectedIndex = index
		}
	}

	func wrap(_ completion: @escaping NavigationCompletion, seed: NavigationSeed) -> NavigationCompletion {
		let currentTag = self.currentTag

		return { [weak self] result in
			if let self = self, currentTag != self.currentTag {
				self.removeAppearingTag(seed.navigationTagHolder.navigationTag)
				self.delegate?.didShow(seed)
			}
			completion(result)
		}
	}

	func back(to tag: NavigationTag, offset: Int, animated: Bool, completion: @escaping NavigationCompletion) {
		let state = capture()
		let predicate: (UIViewController) -> Bool = { self.tag(for: $0) == tag }

		guard offset != 0 || state.stack.topSatisfies(predicate) == false else {
			completion(.success(.noOperation))
			return
		}

		if let index = state.stack.lastIndex(where: predicate) {
			let targetIndex = max(index + offset, 0)
			state.stack.back(to: targetIndex, animated: animated, completion: completion)
		} else if
			// 1. Find the LCA (Lowest common ancestor) between the current VC and the desired one
			// 2. Move to the LCA
			// 3. Switch TBC from the LCA to the desired VC to the desired branches
			// 4. Move to the desired VC from a new active branch
			let source = state.stack.topViewController,
			let destination = state.tree?.search(where: predicate),
			let lca = state.tree?.findLCA(source, destination),
			let index = state.stack.firstIndex(where: { lca == $0 }) {

			state.stack.back(to: index, animated: animated) { _ in
				self.switchTabBarControllers(on: state.tree?.path(to: destination) ?? [])
				let state = self.capture()

				guard let index = state.stack.firstIndex(where: predicate) else {
					completion(.failure(.tagNotFoundAfterTabSwitch(tag: tag)))
					return
				}

				let targetIndex = max(index + offset, 0)
				state.stack.back(to: targetIndex, animated: animated, completion: completion)
			}
		} else {
			completion(.failure(.tagNotFound(tag: tag)))
		}
	}

	func isAppearing(_ tag: NavigationTag) -> Bool {
		appearingTagValues.contains(tag.value)
	}

	func captureAppearingTag(_ tag: String?) {
		if let tag = tag {
			appearingTagValues.insert(tag)
		}
	}

	func removeAppearingTag(_ tag: String?) {
		if let tag = tag {
			appearingTagValues.remove(tag)
		}
	}
}

private extension NavigationSeed {

	var wrappedViewController: UIViewController {
		let navigationController = navigationControllerBuilder?()
		navigationController?.viewControllers = [self.viewController]
		return navigationController ?? self.viewController
	}

	func makeViewController(for presentationStyle: ViewControllerPresentationStyle? = nil) -> UIViewController {
		switch presentationStyle ?? self.presentationStyle {
		case .modal(let modalPresentationStyle):
			let viewController = wrappedViewController
			viewController.modalPresentationStyle = modalPresentationStyle
			return viewController
		case .push:
			return viewController
		case .custom(let transitioningDelegate):
			let viewController = wrappedViewController
			viewController.modalPresentationStyle = .custom
			viewController.transitioningDelegate = transitioningDelegate
			return viewController
		}
	}
}
