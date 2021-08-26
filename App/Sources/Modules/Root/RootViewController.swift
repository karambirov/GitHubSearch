//
//  RootViewController.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController, RootViewControllerHolder {

	var rootViewController: UIViewController? {
		didSet {
			self.removeViewController(oldValue)
			self.addViewController(self.rootViewController)
		}
	}
}

private extension RootViewController {

	func addViewController(_ viewController: UIViewController?) {
		guard let viewController = viewController else { return }

		self.addChild(viewController)
		self.view.addSubview(viewController.view)
		viewController.didMove(toParent: self)

		viewController.view.edgesToSuperview()
	}

	func removeViewController(_ viewController: UIViewController?) {
		guard let viewController = viewController else { return }

		viewController.willMove(toParent: nil)
		viewController.view.removeFromSuperview()
		viewController.removeFromParent()
	}
}
