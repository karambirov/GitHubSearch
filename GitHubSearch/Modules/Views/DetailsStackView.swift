//
//  DetailsStackView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 15/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class DetailsStackView: UIStackView {

    convenience init(repository: Repository) {
        self.init()
        _ = setupArrangedSubviews(with: repository)
            .map { self.addArrangedSubview($0) }
    }

    override func didMoveToSuperview() {
        setupStackView()
    }

}

// MARK: - Setup views
extension DetailsStackView {

    fileprivate func setupStackView() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillProportionally
    }

    fileprivate func setupArrangedSubviews(with repository: Repository) -> [UIView] {
        let notAvailable = "n/a"

        let repositoryInfoView = RepositoryInfoView()
        repositoryInfoView.nameLabel.text = repository.fullName
        repositoryInfoView.nameLabel.font = .boldSystemFont(ofSize: 20)

        repositoryInfoView.descriptionLabel.text = repository.repoDescription
        repositoryInfoView.descriptionLabel.font = .systemFont(ofSize: 17)
        repositoryInfoView.descriptionLabel.textColor = .darkText

        let ownerInfoView = OwnerInfoView()
        ownerInfoView.ownerUserNameLabel.text = "Username: \(repository.owner?.login ?? notAvailable)"
        ownerInfoView.ownerEmailLabel.text = "Email: \(repository.owner?.email ?? notAvailable)"

        return [repositoryInfoView, ownerInfoView]
    }

}
