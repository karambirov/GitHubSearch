//
//  FavoritesRouter.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol FavoritesRouterProtocol: AnyObject {

	func next(with repository: Repository)
}

final class FavoritesRouter {

	var completionHandler: ((Repository) -> Void)?

	private let navigator: Navigator

	init(navigator: Navigator) {
		self.navigator = navigator
	}
}

extension FavoritesRouter: FavoritesRouterProtocol {

	func next(with repository: Repository) {
//		completionHandler?(repository)
		let parameters = DetailsAssembly.Parameters(repository: repository)
		navigator.forward(to: .details, with: parameters)
	}
}
