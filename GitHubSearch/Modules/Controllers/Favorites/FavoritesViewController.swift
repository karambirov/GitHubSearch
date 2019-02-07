//
//  FavoritesViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {

    // MARK: - Properties
    fileprivate let viewModel: FavoritesViewModel
    fileprivate let tableView = UITableView()

    // MARK: - View Controller's life cycle
    init(viewModel: FavoritesViewModel) {
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

}

// MARK: - Table View
extension FavoritesViewController: UITableViewDelegate {

}

// MARK: - Setup
extension FavoritesViewController {
    fileprivate func initialSetup() {
        view.backgroundColor = .white
        setupTableView()
    }

    fileprivate func setupTableView() {

    }
}
