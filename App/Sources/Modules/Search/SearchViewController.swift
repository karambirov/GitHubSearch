//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 27/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject { }

final class SearchViewController: UIViewController, SearchViewControllerProtocol {

	private let searchController = UISearchController(searchResultsController: nil)
	private let contentView = SearchView()

	private let presenter: SearchPresenterProtocol

    init(presenter: SearchPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

	@available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func loadView() {
		self.view = contentView
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.viewDidLoad(contentView)
		setupNavigationBar()
		setupSearchController()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
        super.viewDidAppear(animated)
    }
}

private extension SearchViewController {

    func setupNavigationBar() {
		title = "Search"
        navigationItem.searchController = searchController
    }

    func setupSearchController() {
		definesPresentationContext = true
		searchController.searchBar.placeholder = "Search"
		searchController.searchBar.delegate = contentView
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
    }
}
