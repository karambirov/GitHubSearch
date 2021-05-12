//
//  NavigationError.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

enum NavigationError: Error {

	case registryError(RegistryError)
	case tagNotFound(tag: CustomStringConvertible)
	case tagNotFoundAfterTabSwitch(tag: CustomStringConvertible)
	case cannotDefinePresentationStyle(for: CustomStringConvertible)
	case noRootController
	case noNavigationController(in: CustomStringConvertible)
}

extension NavigationError {

	var localizedDescription: String {
		switch self {
		case .registryError(let registryError):
			return registryError.localizedDescription
		case .cannotDefinePresentationStyle(let controller):
			return "Cannot define a presentation style for the controller \(controller)."
		case .noRootController:
			return "There is no root controller."
		case .noNavigationController(let controller):
			return "The controller \(controller) doesn't have NavigationController, " +
				"the presentation style must be `push`."
		case .tagNotFound(let tag):
			return "There is no tag \(tag) in the navigation tree."
		case .tagNotFoundAfterTabSwitch(let tag):
			return "There is no tag \(tag) in the navigation tree after switching tab."
		}
	}
}
