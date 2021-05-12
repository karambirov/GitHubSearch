//
//  NavigationItem.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

struct NavigationItem<NavigationSeed: NavigationSeedProtocol> {

	let seed: NavigationSeed
	let module: AnyObject?

	init(seed: NavigationSeed, module: AnyObject? = nil) {
		self.seed = seed
		self.module = module
	}

	static func item(seed: NavigationSeed, module: AnyObject? = nil) -> NavigationItem {
		NavigationItem(seed: seed, module: module)
	}
}
