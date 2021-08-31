//
//  ContentCell.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 27.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol RepositoryConfiguringView: UIView {

	func configure(with repository: Repository)
}

final class ContentCell<View: RepositoryConfiguringView>: UICollectionViewCell {

	typealias CellRegistration = UICollectionView.CellRegistration<ContentCell<View>, Repository>

	private lazy var view = View()

	override init(frame: CGRect) {
		super.init(frame: frame)
		constrain()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(with repository: Repository) {
		view.configure(with: repository)
	}

	static func registration() -> CellRegistration {
		CellRegistration { cell, indexPath, repository in
			cell.configure(with: repository)
		}
	}
}

extension ContentCell {

	private func constrain() {
		addSubview(view)
		view.edgesToSuperview(insets: Metrics.contentInsets)
	}
}

private enum Metrics {
	static let contentInsets = UIEdgeInsets(top: .offset16, left: .offset20, bottom: .offset16, right: .offset16)
}
