//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 27/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {

    // MARK: - Properties
    private let viewModel: SearchViewModel
    private lazy var searchController = UISearchController(searchResultsController: nil)
    private lazy var tableView = UITableView()

    // MARK: - View Controller's life cycle
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        guard let repository = viewModel.repository(for: indexPath) else { return }
        viewModel.router.openDetails(for: repository)
    }

}

// MARK: - Search
extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.count > 2 else { return }
        viewModel.searchRepositories(with: query) { [weak self] in
            guard let self = self else { return }
            self.tableView.dataSource = self.viewModel.dataSource
            self.tableView.reloadData()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.deleteLoadedRepositories()
        tableView.reloadData()
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
        tableView.dataSource = viewModel.dataSource
        tableView.delegate   = self
        tableView.tableFooterView = UIView()
    }

    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func clearSelectionForCell() {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: selectedIndexPath, animated: true)
    }

}
