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

	private let presenter: SearchPresenterProtocol
	private let contentView = SearchView()

    private lazy var searchController = UISearchController(searchResultsController: nil)
    private lazy var tableView = UITableView()

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
        initialSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = false
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
        clearSelectionForCell()
        super.viewDidAppear(animated)
    }
}

// MARK: - Table View
extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let repository = viewModel.repository(for: indexPath) else { return }
//        viewModel.router.openDetails(for: repository)
    }
}

// MARK: - Search
extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let query = searchBar.text, query.count > 2 else { return }
//        viewModel.searchRepositories(with: query) { [weak self] in
//            guard let self = self else { return }
//            self.tableView.dataSource = self.viewModel.dataSource
//            self.tableView.reloadData()
//        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        viewModel.deleteLoadedRepositories()
//        tableView.reloadData()
    }
}

// MARK: - Setup
private extension SearchViewController {

    func initialSetup() {
        view.backgroundColor = .white
        definesPresentationContext = true
        setupNavigationBar()
        setupSearchController()
        setupTableView()
        setupViews()
    }

    func setupNavigationBar() {
        navigationItem.searchController = searchController
        title = "Search"
    }

    func setupSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
    }

    func setupTableView() {
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.typeName)
//        tableView.dataSource = viewModel.dataSource
        tableView.delegate = self
        tableView.tableFooterView = UIView()
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 100
    }

    func setupViews() {
        view.addSubview(tableView)
		tableView.edgesToSuperview(usingSafeArea: true)
    }

    func clearSelectionForCell() {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: selectedIndexPath, animated: true)
    }

}
