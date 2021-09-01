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

	func setRepository(_ repository: Repository)
}

final class DetailsView: ProgrammaticView {

	var favoriteTapHandler: (() -> Void)?

	private lazy var collectionView = makeCollectionView()
	private lazy var dataSource = DetailsDataSource(collectionView: collectionView)

	init() {
		super.init(frame: .zero)
	}

	override func constrain() {
		addSubview(collectionView)
		collectionView.edgesToSuperview()
	}
}

extension DetailsView: DetailsViewProtocol {

	func setRepository(_ repository: Repository) {
		dataSource.applySnapshot(with: repository)
	}
}

extension DetailsView: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
		return false
	}
}

private extension DetailsView {

	private func makeCollectionView() -> UICollectionView {
		let layout = makeLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.delegate = self
		return collectionView
	}

	private func makeLayout() -> UICollectionViewCompositionalLayout {
		UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
			let section = DetailsSection.allCases[sectionIndex]
			switch section {
			case .summary:
				let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
				return NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
			case .info:
				var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
				configuration.headerMode = .supplementary
				return NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
			}
		}
	}
}
