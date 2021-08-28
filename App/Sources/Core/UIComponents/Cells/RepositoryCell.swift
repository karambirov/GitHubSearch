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
		static let contentInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
		static let iconSize = CGSize(width: 14, height: 14)
		static let languageIconFrame = CGRect(origin: .zero, size: iconSize)
		static let languageIconCornerRadius = iconSize.height / 2
		static let defaultVerticalOffset: CGFloat = 16.0
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
//		descriptionLabel.numberOfLines = 3
//		descriptionLabel.lineBreakMode = .byTruncatingTail

		starsIcon.image = UIImage(systemName: "star")

		starsLabel.font = .custom(style: .regular)
		starsLabel.textColor = .secondaryLabel

		languageIcon.image = UIImage(systemName: "circle.fill")
		// TODO: Добавить установку цвета языка программирования
		languageIcon.image?.withTintColor(.black, renderingMode: .alwaysTemplate)

		languageLabel.font = .custom(style: .regular)
		languageLabel.textColor = .secondaryLabel
	}

	override func constrain() {
		addSubviews(titleLabel, descriptionLabel)
		addSubviews(starsIcon, starsLabel)
		addSubviews(languageIcon, languageLabel)

		titleLabel.edgesToSuperview(excluding: .bottom)

		descriptionLabel.top(to: titleLabel, offset: Metrics.defaultVerticalOffset)
		descriptionLabel.horizontalToSuperview()

		starsIcon.size(Metrics.iconSize)
		starsIcon.top(to: descriptionLabel, offset: Metrics.defaultVerticalOffset)
		starsIcon.bottomToSuperview()

		starsLabel.leading(to: starsIcon, offset: Metrics.offsetBetweenIconAndLabel)
		starsLabel.bottomToSuperview()

		languageIcon.size(Metrics.iconSize)
		languageIcon.leading(to: starsLabel, offset: Metrics.defaultVerticalOffset)
		languageIcon.bottomToSuperview()

		languageLabel.leading(to: starsIcon, offset: Metrics.offsetBetweenIconAndLabel)
		languageLabel.bottomToSuperview()
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
