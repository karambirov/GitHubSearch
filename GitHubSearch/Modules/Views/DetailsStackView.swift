//
//  DetailsStackView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 15/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

private let notAvailable = "n/a"

final class DetailsStackView: UIStackView {

    convenience init(repository: Repository) {
        let repositoryInfoView = RepositoryInfoView()
        repositoryInfoView.nameLabel.text = repository.fullName
        repositoryInfoView.descriptionLabel.text = repository.repoDescription

        let ownerInfoView = OwnerInfoView()
        ownerInfoView.ownerUserNameLabel.text = "Username: \(repository.owner?.login ?? notAvailable)"
        ownerInfoView.ownerEmailLabel.text = "Email: \(repository.owner?.email ?? notAvailable)"

        self.init(arrangedSubviews: [repositoryInfoView, ownerInfoView])
    }

    override func didMoveToSuperview() {
        setupViews()
    }

}

// MARK: - Setup views
extension DetailsStackView {
    fileprivate func setupViews() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 8
    }
}
