//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class RepositoryCell: UITableViewCell, Describable {

    // MARK: - Properties
    var repository: Repository? {
        didSet {
            // Setup labels
        }
    }

    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

// Setup views
extension RepositoryCell {

    fileprivate func setupViews() {

        self.accessoryType = .disclosureIndicator

        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Repo's name"
            label.font = UIFont.boldSystemFont(ofSize: 17)
            return label
        }()

        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = "Repo's description"
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = UIColor.darkText
            return label
        }()

        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.spacing = 8
            return stackView
        }()

        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.top.equalTo(16)
            make.right.bottom.equalTo(-16)
        }
    }

}
