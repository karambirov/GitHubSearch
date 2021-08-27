//
//  UICollectionView.CellRegistration+cellProvider.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 27.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UICollectionView.CellRegistration {

	var cellProvider: (UICollectionView, IndexPath, Item) -> Cell {
		return { collectionView, indexPath, item in
			collectionView.dequeueConfiguredReusableCell(
				using: self,
				for: indexPath,
				item: item
			)
		}
	}
}
