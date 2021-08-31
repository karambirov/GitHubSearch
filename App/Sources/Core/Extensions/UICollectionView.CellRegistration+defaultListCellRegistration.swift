//
//  UICollectionView.CellRegistration+defaultListCellRegistration.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

typealias ListCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item>

extension ListCellRegistration {

	static func defaultListCellRegistration() -> ListCellRegistration {
		ListCellRegistration { cell, _, _ in
			cell.contentConfiguration = cell.defaultContentConfiguration()
		}
	}
}
