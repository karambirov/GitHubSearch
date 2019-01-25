//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class RepositoryCell: UITableViewCell {

    // MARK: - Properties
    var viewModel: RepositoryCellViewModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewModel = RepositoryCellViewModel()
        viewModel?.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = RepositoryCellViewModel()
        viewModel?.delegate = self
    }

}

// MARK: - Setup views
extension RepositoryCell: RepositoryCellViewModelDelegate {

    func configure(with repository: Repository) {
        self.accessoryType = .disclosureIndicator

        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = repository.fullName
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.numberOfLines = 0
            return label
        }()

        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = repository.repoDescription
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = UIColor.gray
            label.numberOfLines = 0
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
