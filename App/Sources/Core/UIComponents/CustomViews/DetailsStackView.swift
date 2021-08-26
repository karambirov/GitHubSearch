//
//  DetailsStackView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 15/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class DetailsStackView: UIStackView {

    init(repository: Repository) {
		super.init(frame: .zero)
		setup(with: repository)
    }

	@available(*, unavailable)
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Setup views
private extension DetailsStackView {

	func setup(with repository: Repository) {
        axis = .vertical
		distribution = .equalSpacing
		spacing = 24
		makeArrangedSubviews(with: repository).forEach { self.addArrangedSubview($0) }
    }

    func makeArrangedSubviews(with repository: Repository) -> [UIView] {
        let repositoryInfoView = RepositoryInfoView(repository: repository)
		let ownerInfoView = OwnerInfoView(repository: repository)
        return [repositoryInfoView, ownerInfoView]
    }
}
