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

final class SearchViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
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
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
    }
}

// MARK: - Table View Setup
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? SearchResultCell {
            cell.nameLabel?.text = "Tetris"
            cell.ownerLabel?.text = "PSNB92"
            cell.descriptionLabel?.text = "Tetris Project"
            return cell
        }
        
        print("Error occured")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Test"
    
        return cell
    }

}
