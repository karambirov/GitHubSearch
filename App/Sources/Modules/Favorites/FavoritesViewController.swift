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
    private let viewModel: FavoritesViewModel
    private lazy var tableView = UITableView()

    // MARK: - View Controller's life cycle
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

	@available(*, unavailable)
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
            self.tableView.dataSource = self.viewModel.dataSource
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
private extension FavoritesViewController {

    func initialSetup() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupTableView()
        setupViews()
    }

    func setupNavigationBar() {
        title = "Favorites"
    }

    func setupTableView() {
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.typeName)
        tableView.delegate   = self
        tableView.tableFooterView = UIView()
    }

    func setupViews() {
        view.addSubview(tableView)
		tableView.edgesToSuperview()
    }

    func clearSelectionForCell() {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        tableView.deselectRow(at: selectedIndexPath, animated: true)
    }

}
