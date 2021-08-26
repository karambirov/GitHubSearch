//
//  SearchPresenter.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol SearchPresenterProtocol: AnyObject {

	func viewDidLoad(_ view: SearchViewProtocol)
}

final class SearchPresenter {

	private weak var view: SearchViewProtocol?

	private let router: SearchRouter
	private let interactor: SearchInteractorProtocol

	init(
		router: SearchRouter,
		interactor: SearchInteractorProtocol
	) {
		self.router = router
		self.interactor = interactor
	}
}

extension SearchPresenter: SearchPresenterProtocol {

	func viewDidLoad(_ view: SearchViewProtocol) {
		self.view = view
	}
}
