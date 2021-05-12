//
//  RegistryItem.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

struct RegistryItem<NavigationSeed: NavigationSeedProtocol, Module> {

	let seed: NavigationSeed
	let module: Module
}
