//
//  DetailsView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 20.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol DetailsViewProtocol: UIView {

	var favoriteTapHandler: (() -> Void)? { get set }
}

final class DetailsView: ProgrammaticView {

	var favoriteTapHandler: (() -> Void)?

	init() {
		super.init(frame: .zero)
		backgroundColor = .systemBackground
	}
}

extension DetailsView: DetailsViewProtocol { }

private extension DetailsView { }
