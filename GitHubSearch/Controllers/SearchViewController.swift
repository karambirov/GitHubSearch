//
//  MasterViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 16/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import CoreData

class SearchViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    // MARK: - Properties
    fileprivate var detailViewController: DetailViewController? = nil
    fileprivate var managedObjectContext: NSManagedObjectContext? = nil
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var repositories = [Repository]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = true
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
            }
        }
    }

}


// MARK: - Setup
fileprivate extension SearchViewController {

    func initialSetup() {
        setupNavigationBar()
        setupSearchController()
    }

    func setupNavigationBar() {
        navigationItem.searchController = searchController
    }

    func setupSearchController() {
        searchController.searchResultsUpdater                   = self

        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.dimsBackgroundDuringPresentation       = false
        searchController.hidesNavigationBarDuringPresentation   = false

        searchController.searchBar.placeholder                  = "Search Repositories"
        searchController.searchBar.delegate                     = self
    }

}


// MARK: - Table View
extension SearchViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath)
        return cell
    }

}


// MARK: - Navigation
extension SearchViewController {

    /*
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}


// MARK: - UISearchBar Delegate
extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // TODO: - send network request here after a little delay (0.3 secs)
        guard let query = searchBar.text else { return }
        print(query)
    }

}

// MARK: - UISearchResultsUpdating Delegate
extension SearchViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        print(searchBar.text!)
    }

}
