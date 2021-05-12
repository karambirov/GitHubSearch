//
//  NavigationSeed.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UINavigationController

struct NavigationSeed: NavigationSeedProtocol {

	let navigationTagHolder: NavigationTagHolder
	let viewController: UIViewController
	let presentationStyle: ViewControllerPresentationStyle

	let navigationControllerBuilder: (() -> UINavigationController)?

	init(
		viewController: UIViewController & NavigationTagHolder,
		presentationStyle: ViewControllerPresentationStyle = .modal(.fullScreen),
		navigationControllerBuilder: (() -> UINavigationController)? = nil
	) {
		self.navigationTagHolder = viewController
		self.viewController = viewController
		self.presentationStyle = presentationStyle
		self.navigationControllerBuilder = navigationControllerBuilder
	}
}
