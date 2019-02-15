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

    override func didMoveToSuperview() {
        setupViews()
    }

    convenience init() {
        let repositoryInfoView = RepositoryInfoView()
        let ownerInfoView = OwnerInfoView()
        self.init(arrangedSubviews: [repositoryInfoView, ownerInfoView])
    }

}

// MARK: - Setup views
extension DetailsStackView {
    fileprivate func setupViews() {
        self.axis = .vertical
        self.alignment = .fill
        self.spacing = 8
    }
}
