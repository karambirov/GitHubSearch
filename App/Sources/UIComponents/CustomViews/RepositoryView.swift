//
//  RepositoryView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 02.09.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol RepositoryViewProtocol: UIView {

	func configure(with repository: Repository)
}

final class RepositoryView: ProgrammaticView {

	private enum Metrics {
		static let starsIconSize = CGSize(width: 14, height: 14)
		static let languageIconSize = CGSize(width: 12, height: 12)
	}

	private let titleLabel = UILabel()
	private let descriptionLabel = UILabel()

	private let starsIcon = UIImageView()
	private let starsLabel = UILabel()

	private let languageIcon = UIImageView()
	private let languageLabel = UILabel()

	override func configure() {
		titleLabel.font = .custom(style: .subheadline)

		descriptionLabel.font = .custom(style: .regular)
		descriptionLabel.numberOfLines = 3
		descriptionLabel.lineBreakMode = .byTruncatingTail

		starsIcon.image = .sfSymbol(.star)?.withRenderingMode(.alwaysOriginal)

		starsLabel.font = .custom(style: .regular)
		starsLabel.textColor = .secondaryLabel

		languageIcon.image = .sfSymbol(.circleFill)?.withRenderingMode(.alwaysTemplate)

		languageLabel.font = .custom(style: .regular)
		languageLabel.textColor = .secondaryLabel
	}

	override func constrain() {
		addSubviews(titleLabel, descriptionLabel)
		addSubviews(starsIcon, starsLabel)
		addSubviews(languageIcon, languageLabel)

		titleLabel.edgesToSuperview(excluding: .bottom)

		descriptionLabel.topToBottom(of: titleLabel, offset: .offset8)
		descriptionLabel.horizontalToSuperview()

		starsIcon.size(Metrics.starsIconSize)
		starsIcon.topToBottom(of: descriptionLabel, offset: .offset8)
		starsIcon.leadingToSuperview()
		starsIcon.bottomToSuperview()

		starsLabel.leadingToTrailing(of: starsIcon, offset: .offset4)
		starsLabel.centerY(to: starsIcon)

		languageIcon.size(Metrics.languageIconSize)
		languageIcon.leadingToTrailing(of: starsLabel, offset: .offset16)
		languageIcon.centerY(to: starsLabel)

		languageLabel.leadingToTrailing(of: languageIcon, offset: .offset4)
		languageLabel.centerY(to: languageIcon)
		languageLabel.trailingToSuperview()
	}
}

extension RepositoryView: RepositoryViewProtocol {

	func configure(with repository: Repository) {
		titleLabel.text = repository.fullName
		descriptionLabel.text = repository.repoDescription ?? Localization.noDescription
		starsLabel.text = repository.starsCount.shorted()
		languageLabel.text = repository.language ?? Localization.noLanguage
		languageIcon.tintColor = UIColor(language: repository.language)
	}
}
