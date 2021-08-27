//
//  FavoritesView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol FavoritesViewProtocol: UIView {

	var selectItemHandler: ((Repository) -> Void)? { get set }

	func setRepositories(_ repositories: [Repository])
}

final class FavoritesView: UIView {

	private typealias Cell = UICollectionViewListCell
	private typealias CellRegistration = UICollectionView.CellRegistration<Cell, Repository>
	private typealias DataSource = UICollectionViewDiffableDataSource<Section, Repository>
	private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Repository>

	enum Section {
		case main
	}

	var selectItemHandler: ((Repository) -> Void)?

	private var repositories: [Repository] = []
	private lazy var collectionView = makeCollectionView()
	private lazy var dataSource = makeDataSource()

	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupView()
		applySnapshot()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension FavoritesView: FavoritesViewProtocol {

	func setRepositories(_ repositories: [Repository]) {
		self.repositories = repositories
		applySnapshot()
	}
}

extension FavoritesView: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		clearSelectionForCell()
		guard !repositories.isEmpty else { return }
		selectItemHandler?(repositories[indexPath.row])
	}

	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
	}
}

extension FavoritesView {

	private func makeCollectionView() -> UICollectionView {
		let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .grouped))
		let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
		collectionView.delegate = self
		return collectionView
	}

	private func setupView() {
		self.addSubview(collectionView)
		collectionView.edgesToSuperview()
	}

	private func makeCellRegistration() -> CellRegistration {
		CellRegistration { cell, indexPath, repository in
			var content = cell.defaultContentConfiguration()
			// TODO: Заменить на кастомную ячейку
			content.text = repository.fullName
			content.secondaryText = repository.repoDescription
			cell.contentConfiguration = content
		}
	}

	private func makeDataSource() -> DataSource {
		let cellRegistration = makeCellRegistration()
		return DataSource(collectionView: collectionView, cellProvider: cellRegistration.cellProvider)
	}

	private func applySnapshot(animatingDifferences: Bool = true) {
		var snapshot = Snapshot()
		snapshot.appendSections([.main])
		snapshot.appendItems(repositories)
		dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
	}

	private func clearSelectionForCell() {
		guard let indexPathsForSelectedItems = collectionView.indexPathsForSelectedItems else { return }
		indexPathsForSelectedItems.forEach { collectionView.deselectItem(at: $0, animated: true) }
	}
}
