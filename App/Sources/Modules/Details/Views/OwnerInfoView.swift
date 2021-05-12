//
//  OwnerInfoView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 15/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class OwnerInfoView: UIStackView {

	private lazy var titleLabel = makeTitleLabel()
	private lazy var userNameLabel = makeUserNameLabel()
	private lazy var emailLabel = makeEmailLabel()

	init(repository: Repository) {
		super.init(frame: .zero)
		setup(with: repository)
	}

	@available(*, unavailable)
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension OwnerInfoView {
	func update(with repository: Repository) {
		userNameLabel.text = "Username: \(repository.owner?.login ?? "n/a")"
		emailLabel.text = "Email: \(repository.owner?.email ?? "n/a")"
	}
}

// MARK: - Setup views
private extension OwnerInfoView {
    func setup(with repository: Repository) {
		axis = .vertical
		distribution = .equalSpacing
		spacing = 8
		update(with: repository)
		addArrangedSubview(titleLabel)
		addArrangedSubview(userNameLabel)
		addArrangedSubview(emailLabel)
    }

	func makeTitleLabel() -> UILabel {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .title2)
		label.text = "Owner's information"
		return label
	}

	func makeUserNameLabel() -> UILabel {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .body)
		label.numberOfLines = 0
		return label
	}

	func makeEmailLabel() -> UILabel {
		let label = UILabel()
		label.font = .preferredFont(forTextStyle: .body)
		label.textColor = .secondaryLabel
		label.numberOfLines = 0
		return label
	}
}
