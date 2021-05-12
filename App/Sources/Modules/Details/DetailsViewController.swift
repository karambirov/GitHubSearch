//
//  DetailsViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {

    var viewModel: DetailsViewModel

    init(viewModel: DetailsViewModel) {
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

// MARK: - Setup views
private extension DetailsViewController {

    func initialSetup() {
        view.backgroundColor = .white
        title = "About repository"
        setupViews()
        setupNavigationBarRightButton()
    }

    func setupViews() {
        let detailsStackView = DetailsStackView(repository: viewModel.repository)
        view.addSubview(detailsStackView)
		detailsStackView.edgesToSuperview(
			excluding: .bottom,
			insets: .uniform(16),
			usingSafeArea: true
		)
		detailsStackView.bottomToSuperview(offset: 16, relation: .equalOrLess, usingSafeArea: true)
    }

    func setupNavigationBarRightButton() {
        let title = viewModel.repository.isFavorite ? "Unfavorite" : "Favorite"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(favoriteButtonTapped))
    }

    @objc func favoriteButtonTapped() {
        if !viewModel.repository.isFavorite {
            print("Favorite")
            viewModel.toggleFavorite()
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Unfavorite", style: .plain, target: self, action: #selector(favoriteButtonTapped))
        } else {
            print("Delete from Favorite")
            viewModel.toggleFavorite()
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonTapped))
        }
    }

}
