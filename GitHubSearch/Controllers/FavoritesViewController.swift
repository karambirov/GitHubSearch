//
//  FavoritesViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 16/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import CoreData

final class FavoritesViewController: UITableViewController {

    // MARK: - Properties
    fileprivate var detailViewController: DetailViewController? = nil

    fileprivate var coreDataService: CoreDataService!
    fileprivate var managedObjectContext: NSManagedObjectContext? = nil
    fileprivate var _fetchedResultsController: NSFetchedResultsController<Repository>? = nil

    var repositories = [Repository]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

}


// MARK: - Table View
extension FavoritesViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections![section].numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueCell(withIdentifier: RepositoryCell.typeName, for: indexPath)
        let repository = fetchedResultsController.object(at: indexPath)
        configure(cell, withRepository: repository)
        return cell
    }

    func configure(_ cell: RepositoryCell, withRepository repository: Repository) {
        cell.repository = repository
    }


}


// MARK: - NSFetchedResultsController
extension FavoritesViewController {

    var fetchedResultsController: NSFetchedResultsController<Repository> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }

        let fetchRequest: NSFetchRequest<Repository> = Repository.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "fullName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Favorites")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController

        do {
            try _fetchedResultsController?.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }

        return _fetchedResultsController!
    }

    @objc func insertNewRepository(withFullName fullName: String, repoDescription: String, owner: User?) {
        let context = self.fetchedResultsController.managedObjectContext
        let newRepository = Repository(context: context)
        let newUser = User(context: context)

        newRepository.fullName = fullName
        newRepository.repoDescription = repoDescription
        newRepository.owner = owner

        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

}


// MARK: - NSFetchedResultsControllerDelegate
extension FavoritesViewController: NSFetchedResultsControllerDelegate {

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }

}


// MARK: - Setup
fileprivate extension FavoritesViewController {

    func initialSetup() {
        setupNavigationBar()
        setupTableView()
    }

    func setupNavigationBar() {
        clearsSelectionOnViewWillAppear = true
    }


    func setupTableView() {
        let nib = UINib(nibName: RepositoryCell.typeName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: RepositoryCell.typeName)
        tableView.tableFooterView = UIView()
    }

}
