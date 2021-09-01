//
//  ListCellRegistration.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

typealias ListCellRegistration<Item> = UICollectionView.CellRegistration<UICollectionViewListCell, Item>

extension ListCellRegistration {

	static func defaultListCellRegistration() -> ListCellRegistration<Item> {
		ListCellRegistration { cell, _, _ in
			cell.contentConfiguration = cell.defaultContentConfiguration()
		}
	}
}
