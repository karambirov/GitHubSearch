//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RepositoryCell: UICollectionViewCell {

	private enum Metrics {
		static let contentInsets = UIEdgeInsets(top: .offset16, left: .offset20, bottom: .offset16, right: .offset16)
	}

	private let view: RepositoryViewProtocol = RepositoryView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		constrain()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(with repository: Repository) {
		view.configure(with: repository)
	}
}

extension RepositoryCell {

	typealias CellRegistration = UICollectionView.CellRegistration<RepositoryCell, Repository>

	static func registration() -> CellRegistration {
		CellRegistration { cell, _, repository in
			cell.configure(with: repository)
		}
	}
}

extension RepositoryCell {

	private func constrain() {
		contentView.addSubview(view)
		view.edges(to: contentView, insets: Metrics.contentInsets)
	}
}
