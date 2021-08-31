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

	func setRepository(_ repository: Repository)
}

final class DetailsView: ProgrammaticView {

	var favoriteTapHandler: (() -> Void)?

	private let titleLabel = UILabel()
	private let descriptionLabel = UILabel()

	init() {
		super.init(frame: .zero)
		backgroundColor = .systemBackground
	}

	override func configure() {
		titleLabel.font = .custom(style: .headline)

		descriptionLabel.font = .custom(style: .regular)
		descriptionLabel.numberOfLines = 3
		descriptionLabel.lineBreakMode = .byTruncatingTail
	}

	override func constrain() {
		addSubviews(titleLabel, descriptionLabel)

		titleLabel.edgesToSuperview(excluding: .bottom, insets: .uniform(.offset24), usingSafeArea: true)

		descriptionLabel.topToBottom(of: titleLabel, offset: .offset8)
		descriptionLabel.horizontalToSuperview(insets: .horizontal(.offset24))
	}
}

extension DetailsView: DetailsViewProtocol {

	func setRepository(_ repository: Repository) {
		titleLabel.text = repository.fullName
		descriptionLabel.text = repository.repoDescription ?? Localization.noDescription
	}
}

private extension DetailsView { }
