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

    // MARK: - UI
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()

    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.repository.observer = nil
    }

}

// MARK: - Setup
extension RepositoryCell {

    func setup(with viewModel: RepositoryCellViewModel) {
        self.viewModel = viewModel

        self.nameLabel.text        = viewModel.fullName
        self.descriptionLabel.text = viewModel.repoDescription

        viewModel.repository.bind { [weak self] repository in
            guard let self = self else { return }
            self.nameLabel.text        = repository?.fullName
            self.descriptionLabel.text = repository?.repoDescription
        }

        setNeedsLayout()
    }

    func setupViews() {
        self.accessoryType = .disclosureIndicator

        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.top.equalTo(16)
            make.right.bottom.equalTo(-16)
        }
    }

}
