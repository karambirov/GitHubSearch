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
    fileprivate let viewModel = SearchViewModel()
    fileprivate let searchController = UISearchController(searchResultsController: nil)

    fileprivate let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()

    // MARK: - View Controller's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.repositories
            .append(Repository(fullName: "apple/swift",
                               repoDescription: "Programming language. Available for macOS and Linux."))
        initialSetup()
    }

}

// MARK: - Table View
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueCell(withIdentifier: RepositoryCell.typeName, for: indexPath)
        cell.repository = viewModel.repositories[indexPath.row]
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Open details")
    }
}

// MARK: - Search
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        print(searchBar.text!)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Searching...")
    }
}

// MARK: - Setup
extension SearchViewController {
    fileprivate func initialSetup() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupSearchController()
        setupTableView()
        setupViews()
    }

    fileprivate func setupNavigationBar() {
        navigationItem.searchController = searchController
        title = viewModel.title
    }

    fileprivate func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation     = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.definesPresentationContext           = true
        searchController.searchBar.placeholder = viewModel.searchBarPlaceholder
        searchController.searchBar.delegate = self
    }

    fileprivate func setupTableView() {
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.typeName)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Setup views
extension SearchViewController {
    fileprivate func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
