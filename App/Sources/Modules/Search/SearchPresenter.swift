//
//  SearchPresenter.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol SearchPresenterProtocol: AnyObject {

	func viewDidLoad(_ view: SearchViewProtocol)
}

final class SearchPresenter {

	private weak var view: SearchViewProtocol?

	private let router: SearchRouterProtocol
	private let interactor: SearchInteractorProtocol

	init(router: SearchRouterProtocol, interactor: SearchInteractorProtocol) {
		self.router = router
		self.interactor = interactor
	}
}

extension SearchPresenter: SearchPresenterProtocol {

	func viewDidLoad(_ view: SearchViewProtocol) {
		self.view = view

		view.enterSearchQueryHandler = { [weak self] enteredText in
			guard let self = self else { return }
			self.interactor.searchRepositories(with: enteredText) { repositories in
				self.view?.setRepositories(repositories)
			}
		}

		view.cancelButtonTapHandler = { [weak self] in
			self?.view?.setRepositories([])
		}

		view.selectItemHandler = { [weak self] repository in
			// TODO: Реализовать переход на экран подробности
			fatalError("Навигация на экран подробностей не реализована")
//			self?.router.next(with: repository)
		}
	}
}
