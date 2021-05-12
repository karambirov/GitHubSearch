//
//  NavigationItemsRegistry.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

final class NavigationItemsRegistry<NavigationSeed: NavigationSeedProtocol, NavigationTag: NavigationTagProtocol> {

	// tag: [<parameters type id>: <navigation item builder>]
	private var builders = [NavigationTag: [ObjectIdentifier: AnyObject]]()
}

extension NavigationItemsRegistry: NavigationItemsRegistryProtocol {

	func register(
		_ tag: NavigationTag,
		builder: @escaping () -> NavigationItem<NavigationSeed>?
	) {
		let parametersTypeID = ObjectIdentifier(Void.self)
		builders[tag, default: [:]][parametersTypeID] = builder as AnyObject
	}

	func register<Parameters>(
		_ tag: NavigationTag,
		builder: @escaping (Parameters) -> NavigationItem<NavigationSeed>?
	) {
		let parametersTypeID = ObjectIdentifier(Parameters.self)
		builders[tag, default: [:]][parametersTypeID] = builder as AnyObject
	}

	func makeItem<Module>(
		for tag: NavigationTag,
		module: Module.Type
	) -> RegistryResult<NavigationSeed, Module>? {

		let parametersTypeID = ObjectIdentifier(Void.self)

		guard let builder = builders[tag]?[parametersTypeID] as? () -> NavigationItem<NavigationSeed>? else {
			return .failure(.tagNotRegistered(tag: tag, parameters: nil))
		}

		return castItem(builder(), tag: tag)
	}

	func makeItem<Module, Parameters>(
		for tag: NavigationTag,
		with parameters: Parameters,
		module: Module.Type
	) -> RegistryResult<NavigationSeed, Module>? {

		let parametersTypeID = ObjectIdentifier(Parameters.self)

		guard let builder = builders[tag]?[parametersTypeID] as? (Parameters) -> NavigationItem<NavigationSeed>? else {
			return .failure(.tagNotRegistered(tag: tag, parameters: Parameters.self))
		}

		return castItem(builder(parameters), tag: tag)
	}
}

private extension NavigationItemsRegistry {

	func castItem<Module>(
		_ item: NavigationItem<NavigationSeed>?,
		tag: NavigationTag
	) -> RegistryResult<NavigationSeed, Module>? {

		guard let item = item else { return nil }

		guard let module = item.module as? Module else {
			return .failure(.cannotCast(fromType: type(of: item.module), toType: Module.self))
		}

		let typedItem = RegistryItem(seed: item.seed, module: module)
		typedItem.seed.navigationTagHolder.navigationTag = tag.value
		return .success(typedItem)
	}
}
