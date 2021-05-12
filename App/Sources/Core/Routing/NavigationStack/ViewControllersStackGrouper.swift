//
//  ViewControllersStackGrouper.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UITabBarController

final class ViewControllersStackGrouper {

	func group(_ stack: [UIViewController]) -> [Group<UIViewController>] {
		return stack.reduce(into: []) { result, viewController in
			if let last = result.last, last.top is UITabBarController || last.top.onlyChild == viewController {
				result.removeLast()
				result.append(last.appending(viewController))
			} else {
				result.append(.single(viewController))
			}
		}
	}
}
