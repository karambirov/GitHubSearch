//
//  UICollectionView+ElementKind.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UICollectionView {

	enum ElementKind: String {
		case header
	}
}

extension UICollectionView.SupplementaryRegistration {

	init(
		kind: UICollectionView.ElementKind,
		handler: @escaping UICollectionView.SupplementaryRegistration<Supplementary>.Handler
	) {
		self.init(elementKind: kind.rawValue, handler: handler)
	}
}
