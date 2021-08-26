//
//  DetailsRouter.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol DetailsRouterProtocol: AnyObject {

	func back()
}

final class DetailsRouter {

	private let navigator: Navigator

	init(navigator: Navigator) {
		self.navigator = navigator
	}
}

extension DetailsRouter: DetailsRouterProtocol {

	func back() {
		navigator.back()
	}
}
