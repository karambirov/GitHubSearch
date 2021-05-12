//
//  ViewControllersTreeBuilderTests.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import XCTest
@testable import GitHubSearch

final class ViewControllersTreeBuilerTests: XCTestCase {

	private lazy var window = UIWindow(frame: UIScreen.main.bounds)
	private lazy var rootViewController: UIViewController = makeViewController()
	private lazy var builder = ViewControllersTreeBuilder(rootHolder: window)

	override func setUp() {
		super.setUp()
		self.window.rootViewController = self.rootViewController
		self.window.isHidden = false
	}

	func testComplexTreeBuilding() {
		let tabsViewController: UITabBarController = makeViewController()
		let tabController1: UIViewController = makeViewController()
		let navigationController: UINavigationController = makeViewController()
		let tabController2: UIViewController = makeViewController()
		let pushedController1: UIViewController = makeViewController()
		let pushedController2: UIViewController = makeViewController()
		let presentedViewController: UIViewController = makeViewController()

		self.rootViewController.add(child: tabsViewController)

		tabsViewController.viewControllers = [tabController1, navigationController]
		tabsViewController.selectedIndex = 1

		navigationController.viewControllers = [tabController2]
		navigationController.pushViewController(pushedController1, animated: false)
		navigationController.pushViewController(pushedController2, animated: false)

		self.rootViewController.present(presentedViewController, animated: false)

		let tree = builder.build()

		XCTAssertEqual(
			tree?.debugDescription,
			Tree<UIViewController>
				.node(rootViewController, next:
					.fork(tabsViewController, children: [
						.leaf(tabController1),
						.node(tabController2, next:
							.node(pushedController1, next:
								.node(pushedController2, next:
									.leaf(presentedViewController))))
					], selectedChildIndex: 1)
				).debugDescription
		)

		XCTAssertEqual(
			tree?.selectedBranch,
			[
				rootViewController,
				tabsViewController,
				tabController2,
				pushedController1,
				pushedController2,
				presentedViewController
			]
		)
	}
}

private extension ViewControllersTreeBuilerTests {

	func makeViewController<T: UIViewController>() -> T {
		let viewController = T()
		_ = viewController.view
		return viewController
	}
}

extension UIWindow: RootViewControllerHolder { }
