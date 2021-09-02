//
//  DetailsPresenter.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol DetailsPresenterProtocol: AnyObject {

	func viewDidLoad(_ view: DetailsViewProtocol, vc: DetailsViewControllerProtocol)
}

final class DetailsPresenter {

	private weak var view: DetailsViewProtocol?

	private var repository: Repository

	private let router: DetailsRouterProtocol
	private let interactor: DetailsInteractorProtocol

	init(
		router: DetailsRouterProtocol,
		interactor: DetailsInteractorProtocol,
		repository: Repository
	) {
		self.router = router
		self.interactor = interactor
		self.repository = repository
	}
}

extension DetailsPresenter: DetailsPresenterProtocol {

	func viewDidLoad(_ view: DetailsViewProtocol, vc: DetailsViewControllerProtocol) {
		self.view = view

		self.view?.setRepository(repository)

		view.favoriteTapHandler = { [weak self] in
			guard let self = self else { return }
			self.interactor.toggleFavorite(self.repository)
		}
	}
}
