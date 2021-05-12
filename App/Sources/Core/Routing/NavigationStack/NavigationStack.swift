//
//  NavigationStack.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UISearchController
import class UIKit.UINavigationController
import class Foundation.DispatchQueue
import class Foundation.DispatchGroup

final class NavigationStack {

	typealias Predicate = (UIViewController) -> Bool

	var length: Int {
		groups.count
	}

	var topViewController: UIViewController? {
		groups.last?.top
	}

	var topPresentationStyle: ViewControllerPresentationStyle? {
		groups.last?.bottom.presentationStyle
	}

	private let groups: [Group<UIViewController>]

	init(stack: [UIViewController]) {
		let grouper = ViewControllersStackGrouper()
		self.groups = grouper.group(stack)
	}
}

extension NavigationStack {

	func forward(
		to viewController: UIViewController,
		with presentationStyle: ViewControllerPresentationStyle,
		animated: Bool,
		completion: NavigationCompletion?
	) {

		guard let last = groups.last else {
			completion?(.failure(.noRootController))
			return
		}

		let successCompletion: () -> Void = {
			completion?(.success)
		}

		switch presentationStyle {
		case .modal, .custom:
			let present: (UIViewController?) -> Void = { from in
				from?.present(viewController, animated: animated, completion: successCompletion)
			}

			if last.top is UISearchController {
				last.top.dismiss(animated: true) { present(self.groups.dropLast().last?.top) }
			} else {
				present(last.top)
			}
		case . push:
			guard let navigationController = last.top.navigationController
				?? last.top.presentingViewController?.navigationController
			else {
				completion?(.failure(.noNavigationController(in: last.top)))
				return
			}

			navigationController.pushViewController(viewController, animated: animated, completion: successCompletion)
		}
	}

	func back(animated: Bool, completion: NavigationCompletion?) {
		guard
			groups.count > 1,
			let last = groups.last
		else {
			completion?(.success(.noOperation))
			return
		}

		let successCompletion: () -> Void = {
			completion?(.success)
		}

		switch last.bottom.presentationStyle {
		case .modal?:
			last.bottom.dismiss(animated: animated, completion: successCompletion)
		case .push?:
			last.bottom.navigationController?.popViewController(animated: animated, completion: successCompletion)
		default:
			completion?(.failure(.cannotDefinePresentationStyle(for: last.bottom)))
		}
	}

	func back(to index: Int, animated: Bool, completion: NavigationCompletion?) {
		let index = max(0, index)

		guard
			groups.count > 1,
			index < groups.count - 1
		else {
			completion?(.successNoOperation)
			return
		}

		let current = groups[index]
		let next = groups[index + 1]

		let successCompletion: () -> Void = {
			completion?(.success)
		}

		switch next.bottom.presentationStyle {
		case .modal?:
			current.top.dismiss(animated: animated, completion: successCompletion)
		case .push?:
			current.top.pop(animated: animated, completion: successCompletion)
		default:
			completion?(.failure(.cannotDefinePresentationStyle(for: next.bottom)))
		}
	}

	func backToFlowRoot(animated: Bool, completion: NavigationCompletion?) {
		guard
			groups.count > 1,
			let last = groups.last,
			let navigationController = last.top.navigationController
		else {
			completion?(.successNoOperation)
			return
		}

		navigationController.popToRootViewController(animated: animated) {
			completion?(.success)
		}
	}
}

extension NavigationStack {

	func topSatisfies(_ predicate: Predicate) -> Bool {
		groups.last?.contains(where: predicate) ?? false
	}

	func firstIndex(where predicate: Predicate) -> Int? {
		groups.firstIndex { $0.contains(where: predicate) }
	}

	func lastIndex(where predicate: Predicate) -> Int? {
		groups.lastIndex { $0.contains(where: predicate) }
	}
}

private extension UIViewController {

	func pop(animated: Bool, completion: (() -> Void)?) {
		let dispatchGroup = DispatchGroup()

		if self.presentedViewController != nil {
			dispatchGroup.enter()
			dismiss(animated: animated) { dispatchGroup.leave() }
		}

		dispatchGroup.enter()
		navigationController?.popToViewController(self, animated: animated) { dispatchGroup.leave() }

		dispatchGroup.notify(queue: .main) { completion?() }
	}
}

private extension UINavigationController {

	func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
		pushViewController(viewController, animated: animated)
		complete(animated: animated, completion: completion)
	}

	func popViewController(animated: Bool, completion: (() -> Void)?) {
		popViewController(animated: animated)
		complete(animated: animated, completion: completion)
	}

	func popToViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
		popToViewController(viewController, animated: animated)
		complete(animated: animated, completion: completion)
	}

	func popToRootViewController(animated: Bool, completion: (() -> Void)?) {
		popToRootViewController(animated: animated)
		complete(animated: animated, completion: completion)
	}

	func complete(animated: Bool, completion: (() -> Void)?) {
		let completion = {
			DispatchQueue.main.async { completion?() }
		}

		if animated, let coordinator = self.transitionCoordinator {
			coordinator.animate(alongsideTransition: nil) { _ in
				completion()
			}
		} else {
			completion()
		}
	}
}
