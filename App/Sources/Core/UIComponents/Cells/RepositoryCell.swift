//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

typealias RepositoryCell = ContentCell<RepositoryView>

final class RepositoryView: ProgrammaticView {

	private enum Metrics {
		static let starsIconSize = CGSize(width: 14, height: 14)
		static let languageIconSize = CGSize(width: 12, height: 12)
		static let defaultVerticalOffset: CGFloat = 8.0
		static let defaultHorizontalOffset: CGFloat = 16.0
		static let offsetBetweenIconAndLabel: CGFloat = 4.0
	}

	private let titleLabel = UILabel()
	private let descriptionLabel = UILabel()

	private let starsIcon = UIImageView()
	private let starsLabel = UILabel()

	private let languageIcon = UIImageView()
	private let languageLabel = UILabel()

	override func configure() {
		titleLabel.font = .custom(style: .headline)

		descriptionLabel.font = .custom(style: .regular)
		descriptionLabel.numberOfLines = 3
		descriptionLabel.lineBreakMode = .byTruncatingTail

		starsIcon.image = UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal)

		starsLabel.font = .custom(style: .regular)
		starsLabel.textColor = .secondaryLabel

		// TODO: Добавить установку цвета языка программирования
		languageIcon.image = UIImage(systemName: "circle.fill")?.withRenderingMode(.alwaysOriginal)

		languageLabel.font = .custom(style: .regular)
		languageLabel.textColor = .secondaryLabel
	}

	override func constrain() {
		addSubviews(titleLabel, descriptionLabel)
		addSubviews(starsIcon, starsLabel)
		addSubviews(languageIcon, languageLabel)

		titleLabel.edgesToSuperview(excluding: .bottom)

		descriptionLabel.topToBottom(of: titleLabel, offset: Metrics.defaultVerticalOffset)
		descriptionLabel.horizontalToSuperview()

		starsIcon.size(Metrics.starsIconSize)
		starsIcon.topToBottom(of: descriptionLabel, offset: Metrics.defaultVerticalOffset)
		starsIcon.leadingToSuperview()
		starsIcon.bottomToSuperview()

		starsLabel.leadingToTrailing(of: starsIcon, offset: Metrics.offsetBetweenIconAndLabel)
		starsLabel.centerY(to: starsIcon)

		languageIcon.size(Metrics.languageIconSize)
		languageIcon.leadingToTrailing(of: starsLabel, offset: Metrics.defaultHorizontalOffset)
		languageIcon.centerY(to: starsLabel)

		languageLabel.leadingToTrailing(of: languageIcon, offset: Metrics.offsetBetweenIconAndLabel)
		languageLabel.centerY(to: languageIcon)
		languageLabel.trailingToSuperview()
	}
}

extension RepositoryView: RepositoryConfiguringView {

	func configure(with repository: Repository) {
		titleLabel.text = repository.fullName
		descriptionLabel.text = repository.repoDescription ?? "No description provided."
		starsLabel.text = String(repository.starsCount)
		languageLabel.text = repository.language ?? "No language"
	}
}
