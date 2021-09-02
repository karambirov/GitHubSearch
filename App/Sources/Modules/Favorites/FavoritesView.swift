//
//  FavoritesView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol FavoritesViewProtocol: UIView { }

final class FavoritesView: ProgrammaticView {

	private let label = UILabel()

	init() {
		super.init(frame: .zero)
	}

	override func configure() {
		backgroundColor = .systemBackground
		label.text = "Saving repositories will be available in future updates"
		label.numberOfLines = 0
		label.textAlignment = .center
		label.font = .custom(style: .headline)
	}

	override func constrain() {
		addSubview(label)
		label.width(250)
		label.center(in: self)
	}
}

extension FavoritesView: FavoritesViewProtocol { }
