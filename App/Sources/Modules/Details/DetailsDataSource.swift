//
//  DetailsDataSource.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

enum DetailsSection: CaseIterable {
	case summary
	case favoriteButton
	case info
}

enum DetailsItem: Hashable {
	case summary(Repository)
	case favoriteButton(FavoriteButtonType)
	case infoItem(text: String, value: String)
}

final class DetailsDataSource: UICollectionViewDiffableDataSource<DetailsSection, DetailsItem> {

	private typealias Snapshot = NSDiffableDataSourceSnapshot<DetailsSection, DetailsItem>

	convenience init(collectionView: UICollectionView) {
		self.init(collectionView: collectionView) { collectionView, indexPath, item in
			let section = DetailsSection.allCases[indexPath.section]
			switch section {
			case .summary:
				return Self.summaryCell(in: collectionView, for: item, at: indexPath)
			case .favoriteButton:
				return Self.favoriteButtonCell(in: collectionView, for: item, at: indexPath)
			case .info:
				return Self.infoCell(in: collectionView, for: item, at: indexPath)
			}
		}

		self.supplementaryViewProvider = { collectionView, _, indexPath in
			let section = DetailsSection.allCases[indexPath.section]
			switch section {
			case .summary, .favoriteButton:
				return nil
			case .info:
				let registration = TextSectionHeader.registration(headerText: Localization.information)
				return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
			}
		}
	}
}

extension DetailsDataSource {

	func applySnapshot(with repository: Repository, animatingDifferences: Bool = true) {
		var snapshot = Snapshot()
		snapshot.appendSections(DetailsSection.allCases)
		snapshot.appendItems([.summary(repository)], toSection: .summary)

		let type: FavoriteButtonType = repository.isFavorite ? .unfavorite : .favorite
		snapshot.appendItems([.favoriteButton(type)], toSection: .favoriteButton)

		let items: [DetailsItem] = [
			.infoItem(text: Localization.issues, value: "\(repository.openIssuesCount)"),
			.infoItem(text: Localization.license, value: repository.license?.name ?? Localization.notAvailable)
		]
		snapshot.appendItems(items, toSection: .info)

		self.apply(snapshot, animatingDifferences: animatingDifferences)
	}
}

extension DetailsDataSource {

	private static func summaryCell(
		in collectionView: UICollectionView,
		for item: DetailsItem,
		at indexPath: IndexPath
	) -> UICollectionViewCell {

		switch item {
		case .summary(let repository):
			let registration = RepositoryCell.registration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: repository)
		case .infoItem, .favoriteButton:
			let registration = ListCellRegistration<DetailsItem>.defaultListCellRegistration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
		}
	}

	private static func favoriteButtonCell(
		in collectionView: UICollectionView,
		for item: DetailsItem,
		at indexPath: IndexPath
	) -> UICollectionViewCell {

		switch item {
		case .favoriteButton(let type):
			let registration = FavoriteButtonCell.registration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: type)
		case .infoItem, .summary:
			let registration = ListCellRegistration<DetailsItem>.defaultListCellRegistration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
		}
	}

	private static func infoCell(
		in collectionView: UICollectionView,
		for item: DetailsItem,
		at indexPath: IndexPath
	) -> UICollectionViewCell {

		switch item {
		case .summary, .favoriteButton:
			let registration = ListCellRegistration<DetailsItem>.defaultListCellRegistration()
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
		case .infoItem(let text, let value):
			let registration = RepositoryInfoCell.infoCellRegistration(text: text, secondaryText: value)
			return collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
		}
	}
}
