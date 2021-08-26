//
//  DetailsView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol DetailsViewProtocol: UIView {

	var favoriteTapHandler: (() -> Void)? { get set }
}

final class DetailsView: UIView {

	var favoriteTapHandler: (() -> Void)?

	init() {
		super.init(frame: .zero)
		backgroundColor = .systemBackground
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension DetailsView: DetailsViewProtocol { }

private extension DetailsView {
//	func setupViews() {
//		let detailsStackView = DetailsStackView(repository: viewModel.repository)
//		view.addSubview(detailsStackView)
//		detailsStackView.edgesToSuperview(
//			excluding: .bottom,
//			insets: .uniform(16),
//			usingSafeArea: true
//		)
//		detailsStackView.bottomToSuperview(offset: 16, relation: .equalOrLess, usingSafeArea: true)
//	}
//
//	func setupNavigationBarRightButton() {
//		let title = viewModel.repository.isFavorite ? "Unfavorite" : "Favorite"
//		navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(favoriteButtonTapped))
//	}
//
//	@objc func favoriteButtonTapped() {
//		if !viewModel.repository.isFavorite {
//			print("Favorite")
//			viewModel.toggleFavorite()
//			navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Unfavorite", style: .plain, target: self, action: #selector(favoriteButtonTapped))
//		} else {
//			print("Delete from Favorite")
//			viewModel.toggleFavorite()
//			navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonTapped))
//		}
//	}
}
