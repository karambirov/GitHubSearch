//
//  RepositoryInfoView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RepositoryInfoView: UIStackView {

	private lazy var nameLabel = makeNameLabel()
	private lazy var descriptionLabel = makeDescriptionLabel()

	init(repository: Repository) {
		super.init(frame: .zero)
		self.setup(with: repository)
	}

	@available(*, unavailable)
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension RepositoryInfoView {
	func update(with repository: Repository) {
		self.nameLabel.text = repository.fullName
		self.descriptionLabel.text = repository.repoDescription
	}
}

// MARK: - Setup views
private extension RepositoryInfoView {
    func setup(with repository: Repository) {
		axis = .vertical
		alignment = .fill
		distribution = .equalSpacing
		spacing = 8
		update(with: repository)
		addArrangedSubview(nameLabel)
		addArrangedSubview(descriptionLabel)
    }

	func makeNameLabel() -> UILabel {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .body)
		label.adjustsFontSizeToFitWidth = true
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
//		label.setHugging(.required, for: .vertical)
//		label.setCompressionResistance(.required, for: .vertical)
		return label
	}

	func makeDescriptionLabel() -> UILabel {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .footnote)
		label.textColor = .secondaryLabel
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
//		label.setHugging(.defaultHigh, for: .vertical)
//		label.setCompressionResistance(.defaultHigh, for: .vertical)
		return label
	}
}
