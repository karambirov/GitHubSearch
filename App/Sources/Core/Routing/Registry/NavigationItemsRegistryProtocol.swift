//
//  NavigationItemsRegistryProtocol.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

typealias RegistryResult<NavigationSeed: NavigationSeedProtocol, Module> =
	Result<RegistryItem<NavigationSeed, Module>, RegistryError>

protocol NavigationItemsRegistryProtocol: AnyObject {

	associatedtype NavigationSeed: NavigationSeedProtocol
	associatedtype NavigationTag: NavigationTagProtocol

	func register(_ tag: NavigationTag, builder: @escaping () -> NavigationItem<NavigationSeed>?)
	func register<Parameters>(_ tag: NavigationTag, builder: @escaping (Parameters) -> NavigationItem<NavigationSeed>?)

	func makeItem<Module>(for tag: NavigationTag, module: Module.Type) -> RegistryResult<NavigationSeed, Module>?

	func makeItem<Module, Parameters>(
		for tag: NavigationTag,
		with parameters: Parameters,
		module: Module.Type
	) -> RegistryResult<NavigationSeed, Module>?
}
