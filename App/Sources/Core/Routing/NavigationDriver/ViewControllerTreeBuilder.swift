//
//  ViewControllerTreeBuilder.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UITabBarController
import class UIKit.UINavigationController

final class ViewControllerTreeBuilder {

	private let rootHolder: RootViewControllerHolder

	init(rootHolder: RootViewControllerHolder) {
		self.rootHolder = rootHolder
	}

	func build() -> Tree<UIViewController>? {
		guard let rootViewController = self.rootHolder.rootViewController else { return nil }
		return self.tree(from: rootViewController, excluding: [])
	}
}

extension ViewControllerTreeBuilder {

	func tree(
		from viewController: UIViewController,
		excluding: Set<UIViewController>
	) -> Tree<UIViewController>? {

		guard excluding.contains(viewController) == false else { return nil }

		if let tabBarController = viewController as? UITabBarController {
			return tree(from: tabBarController, excluding: excluding)
		} else if let navigationController = viewController as? UINavigationController {
			return tree(from: navigationController, excluding: excluding)
		} else if let onlyChild = viewController.onlyChild {
			return node(from: viewController, to: onlyChild, excluding: excluding)
		} else if let presented = viewController.presentedViewController {
			return node(from: viewController, to: presented, excluding: excluding)
		}

		return .leaf(viewController)
	}

	func tree(
		from tabBarController: UITabBarController,
		excluding: Set<UIViewController>
	) -> Tree<UIViewController>? {

		guard
			let selectedViewController = tabBarController.selectedViewController,
			let selectedTree = self.tree(from: selectedViewController, excluding: excluding)
		else {
			return nil
		}

		let excluded = Set(selectedTree.allValues).union(excluding)
		let selectedIndex = tabBarController.selectedIndex

		var children = tabBarController
			.viewControllers?
			.filter { $0 != selectedViewController }
			.compactMap { tree(from: $0, excluding: excluded) } ?? []

		children.insert(selectedTree, at: selectedIndex)

		return .fork(tabBarController, children: children, selectedChildIndex: selectedIndex)
	}

	func tree(
		from navigationController: UINavigationController,
		excluding: Set<UIViewController>
	) -> Tree<UIViewController>? {

		let viewControllers = navigationController.viewControllers.filter { excluding.contains($0) == false }
		return .branch(from: viewControllers) { tree(from: $0, excluding: excluding) }
	}

	func node(
		from viewController: UIViewController,
		to nextViewController: UIViewController,
		excluding: Set<UIViewController>
	) -> Tree<UIViewController> {

		guard let next = self.tree(from: nextViewController, excluding: excluding) else {
			return .leaf(viewController)
		}
		return .node(viewController, next: next)
	}
}
