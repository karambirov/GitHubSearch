//
//  SearchView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol SearchViewProtocol: AnyObject {

	var enterSearchQueryHandler: ((String) -> Void)? { get set }
	var cancelButtonTapHandler: (() -> Void)? { get set }
	var selectItemHandler: ((Repository) -> Void)? { get set }

	func setRepositories(_ repositories: [Repository])
}

final class SearchView: ProgrammaticView {

	private typealias DataSource = UICollectionViewDiffableDataSource<Section, Repository>
	private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Repository>

	enum Section {
		case main
	}

	var enterSearchQueryHandler: ((String) -> Void)?
	var cancelButtonTapHandler: (() -> Void)?
	var selectItemHandler: ((Repository) -> Void)?

	private var repositories: [Repository] = []

	private lazy var collectionView = makeCollectionView()
	private lazy var dataSource = makeDataSource()

	init() {
		super.init(frame: .zero)
		applySnapshot()
	}

	override func constrain() {
		addSubview(collectionView)
		collectionView.edgesToSuperview()
	}
}

extension SearchView: SearchViewProtocol {

	func setRepositories(_ repositories: [Repository]) {
		self.repositories = repositories
		applySnapshot()
	}
}

extension SearchView: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		clearSelectionForCell()
		guard !repositories.isEmpty else { return }
		selectItemHandler?(repositories[indexPath.row])
	}

	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
	}
}

extension SearchView: UISearchBarDelegate {

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let enteredText = searchBar.text else { return }
		enterSearchQueryHandler?(enteredText)
	}

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		cancelButtonTapHandler?()
	}
}

extension SearchView {

	private func makeCollectionView() -> UICollectionView {
		let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .grouped))
		let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
		collectionView.delegate = self
		return collectionView
	}

	private func makeDataSource() -> DataSource {
		let cellRegistration = RepositoryCell.registration()
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
