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
        return repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryCell = tableView.dequeueCell(withIdentifier: RepositoryCell.typeName, for: indexPath)
        configure(cell, withRepository: repositories[indexPath.row])
        return cell
    }

     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
     }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    func configure(_ cell: RepositoryCell, withRepository repository: Repository) {
        cell.repository = repository
    }


}


// MARK: - Fetched Results Controller
extension FavoritesViewController: NSFetchedResultsControllerDelegate {

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

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            let cell = tableView.cellForRow(at: indexPath!) as! RepositoryCell
            configure(cell, withRepository: anObject as! Repository)
        case .move:
            let cell = tableView.cellForRow(at: indexPath!) as! RepositoryCell
            configure(cell, withRepository: anObject as! Repository)
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
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
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    func setupTableView() {
        let nib = UINib(nibName: RepositoryCell.typeName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: RepositoryCell.typeName)
        tableView.tableFooterView = UIView()
    }

}
