//
//  SearchViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/02/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

private enum Constants {
    static let nibName = "SearchViewController"
    static let cellIdentifier = "SearchResultCell"
    static let searchBarPlaceholder = "Search Repositories"
    static let navigationTitle = "Search"
}

struct Repository {
    let repoFullName: String
    let ownerName: String
    let repoDescription: String
    let ownerEmail: String
}

final class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    // MARK: - Properties
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    let repositories = [Repository](repeating: Repository(repoFullName: "gena/repo", ownerName: "Gena", repoDescription: "My first repo", ownerEmail: "gena@gmail.com"), count: 30)
    
    // MARK: - ViewController's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    static func instantiateFromNib() -> SearchViewController {
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        let vc = nib.instantiate(withOwner: nil, options: nil).first as! SearchViewController
        return vc
    }

}

// MARK: - Setup
extension SearchViewController {
    
    fileprivate func initialSetup() {
        setupTableView()
        setupNavigationBar()
        setupSearchController()
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: Constants.cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = Constants.navigationTitle
        navigationItem.searchController = searchController
    }
    
    fileprivate func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = Constants.searchBarPlaceholder
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        print(searchBar.text!)
        // TODO: - send network request here
        // send after a little delay from typing
    }
    
}

// MARK: - Table View Setup
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    // TODO: - Fill in with actual data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? SearchResultCell {
            cell.nameLabel?.text = repositories[indexPath.row].repoFullName
            cell.ownerLabel?.text = repositories[indexPath.row].ownerName
            cell.descriptionLabel?.text = repositories[indexPath.row].repoDescription
            return cell
        }
        
        print("Error occured")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Test"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController.instantiateFromNib()
        detail.ownerName = repositories[indexPath.row].repoFullName
        detail.ownerEmail = repositories[indexPath.row].ownerEmail
        detail.repoFullName = repositories[indexPath.row].repoFullName
        detail.repoDescription = repositories[indexPath.row].repoDescription
        
        navigationController?.pushViewController(detail, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}





























