//
//  RootAssembly.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit

enum RootAssembly {

	struct Parameters {
		let tabBarController: UITabBarController
	}

	static func makeModule(parameters: Parameters) -> UIViewController {
		return RootViewController(tabBarController: parameters.tabBarController)
	}
}
