//
//  SearchRouter.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol SearchRouterProtocol: AnyObject {

	func next(with repository: Repository)
}

final class SearchRouter {

	var completionHandler: ((Repository) -> Void)?

	private let navigator: Navigator

	init(navigator: Navigator) {
		self.navigator = navigator
	}
}

extension SearchRouter: SearchRouterProtocol {

	func next(with repository: Repository) {
//		completionHandler?(repository)
		let parameters = DetailsAssembly.Parameters(repository: repository)
		navigator.forward(to: .details, with: parameters)
	}
}
