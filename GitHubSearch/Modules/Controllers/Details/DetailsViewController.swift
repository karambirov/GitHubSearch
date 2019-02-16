//
//  DetailsViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class DetailsViewController: UIViewController {

    var viewModel: DetailsViewModel

    fileprivate var detailsStackView: DetailsStackView?

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
extension DetailsViewController {

    fileprivate func initialSetup() {
        view.backgroundColor = .white
        title = "About repository"
        setupViews()
        setupNavigationBarRightButton()
    }

    private func setupViews() {
        detailsStackView = DetailsStackView(repository: viewModel.repository)
        guard let detailsStackView = detailsStackView else { return }
        view.addSubview(detailsStackView)

        detailsStackView.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.lessThanOrEqualTo(self.view.safeAreaLayoutGuide)
        }
    }

    private func setupNavigationBarRightButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonTapped))
    }

    @objc private func favoriteButtonTapped() {
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
