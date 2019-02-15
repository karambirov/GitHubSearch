//
//  OwnerInfoView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 15/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class OwnerInfoView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Owner's information"
        label.numberOfLines = 0
        return label
    }()

    lazy var ownerUserNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    lazy var ownerEmailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, ownerUserNameLabel, ownerEmailLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    override func didMoveToSuperview() {
        setupViews()
    }

}

// MARK: - Setup views
extension OwnerInfoView {
    fileprivate func setupViews() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.top.equalTo(16)
            make.right.bottom.equalTo(-16)
        }
    }
}
