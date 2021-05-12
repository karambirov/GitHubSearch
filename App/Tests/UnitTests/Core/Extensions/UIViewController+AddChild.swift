//
//  UIViewController+AddChild.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController

extension UIViewController {

	func add(child viewController: UIViewController) {
		addChild(viewController)
		view.addSubview(viewController.view)
		viewController.didMove(toParent: self)
	}
}
