//
//  FavoritesPresenter.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol FavoritesPresenterProtocol: AnyObject {

	func viewDidLoad(_ view: FavoritesViewProtocol)
}

final class FavoritesPresenter {

	private weak var view: FavoritesViewProtocol?

	private let router: FavoritesRouterProtocol
	private let interactor: FavoritesInteractorProtocol

	init(router: FavoritesRouterProtocol, interactor: FavoritesInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}

}

extension FavoritesPresenter: FavoritesPresenterProtocol {

	func viewDidLoad(_ view: FavoritesViewProtocol) {
		self.view = view
	}
}
