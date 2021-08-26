//
//  FavoritesView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol FavoritesViewProtocol: UIView { }

final class FavoritesView: UIView {

	init() {
		super.init(frame: .zero)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension FavoritesView: FavoritesViewProtocol { }
