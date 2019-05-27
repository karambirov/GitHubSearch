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
    fileprivate lazy var tableView = UITableView()

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchFavoriteRepositories { [weak self] in
            guard let self = self else { return }
            self.tableView.dataSource = viewModel.dataSource
            self.tableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        clearSelectionForCell()
        super.viewDidAppear(animated)
    }

}

// MARK: - Table View
extension FavoritesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repository = viewModel.repository(for: indexPath) else { return }
        viewModel.router.openDetails(for: repository)
    }

}

// MARK: - Setup
extension FavoritesViewController {

    fileprivate func initialSetup() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
        setupViews()
    }

    fileprivate func setupNavigationBar() {
        title = "Favorites"
    }

    fileprivate func setupTableView() {
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.typeName)
//        tableView.dataSource = viewModel.dataSource
//        tableView.delegate   = self
        tableView.tableFooterView = UIView()
    }

    fileprivate func clearSelectionForCell() {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: selectedIndexPath, animated: true)
    }

}

// MARK: - Setup views
extension FavoritesViewController {

    fileprivate func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

}
