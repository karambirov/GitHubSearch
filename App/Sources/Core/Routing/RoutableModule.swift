//
//  RoutableModule.swift
//  GitHubSearchUnitTests
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UINavigationController

struct RoutableModule<Input> {

	let viewController: UIViewController & NavigationTagHolder
	let input: Input?

	init(viewController: UIViewController & NavigationTagHolder, input: Input? = nil) {
		self.viewController = viewController
		self.input = input
	}
}

extension RoutableModule {

	func wrapInNavigationItem(
		style: ViewControllerPresentationStyle,
		navigationControllerBuilder: (() -> UINavigationController)? = nil
	) -> NavigationItem<NavigationSeed> {

		viewController.hidesBottomBarWhenPushed = true

		let seed = NavigationSeed(
			viewController: viewController,
			presentationStyle: style,
			navigationControllerBuilder: navigationControllerBuilder
		)

		return NavigationItem(seed: seed, module: input as AnyObject)
	}
}
