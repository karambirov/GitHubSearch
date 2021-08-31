//
//  DetailsDataSource.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

enum Section: CaseIterable {
	case summary
	case info
}

enum Item: Hashable {
	case summary(Repository)
	case infoItem(text: String, value: String)
}

final class DetailsDataSource: UICollectionViewDiffableDataSource<Section, Item> {

	private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
	private typealias ListCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item>

	convenience init(collectionView: UICollectionView) {
		self.init(collectionView: collectionView) { collectionView, indexPath, item in
			let section = Section.allCases[indexPath.section]
			switch section {
			case .summary:
				return Self.summaryCell(in: collectionView, for: item, at: indexPath)
			case .info:
				return Self.infoCell(in: collectionView, for: item, at: indexPath)
			}
		}

		self.supplementaryViewProvider = { collectionView, _, indexPath in
			let section = Section.allCases[indexPath.section]
			switch section {
			case .summary:
				return nil
			case .info:
				let registration = TextSectionHeader.registration(headerText: "Information")
				return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
			}
		}
	}
}

extension DetailsDataSource {

	func applySnapshot(with repository: Repository, animatingDifferences: Bool = true) {
		var snapshot = Snapshot()
		snapshot.appendSections(Section.allCases)
		snapshot.appendItems([.summary(repository)], toSection: .summary)

		let items: [Item] = [
			.infoItem(text: "Owner's email", value: repository.owner.email ?? "N/A"),
			.infoItem(text: "Issues", value: "\(repository.openIssuesCount)"),
			.infoItem(text: "License", value: repository.license?.name ?? "N/A")
		]
		snapshot.appendItems(items, toSection: .info)

		self.apply(snapshot, animatingDifferences: animatingDifferences)
	}
}

extension DetailsDataSource {

	private static func summaryCell(
		in collectionView: UICollectionView,
		for item: Item,
		at indexPath: IndexPath
	) -> UICollectionViewCell {

		switch item {
		case .summary(let repository):
			let registration = RepositoryCell.registration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: repository)
		case .infoItem:
			let registration = self.defaultCellRegistration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
		}
	}

	private static func infoCell(
		in collectionView: UICollectionView,
		for item: Item,
		at indexPath: IndexPath
	) -> UICollectionViewCell {

		switch item {
		case .summary:
			let registration = self.defaultCellRegistration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
		case .infoItem(let text, let value):
			let registration = self.infoCellRegistration(text: text, secondaryText: value)
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
		}
	}
}

extension DetailsDataSource {

	private static func infoCellRegistration(text: String, secondaryText: String) -> ListCellRegistration {
		ListCellRegistration { cell, indexPath, infoItem in
			var content = UIListContentConfiguration.valueCell()
			content.text = text
			content.secondaryText = secondaryText
			cell.contentConfiguration = content
		}
	}

	private static func defaultCellRegistration() -> ListCellRegistration {
		ListCellRegistration { cell, _, _ in
			cell.contentConfiguration = cell.defaultContentConfiguration()
		}
	}
}
