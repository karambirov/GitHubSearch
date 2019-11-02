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
    private var viewModel: RepositoryCellViewModel?
    private lazy var repositoryInfoView = RepositoryInfoView()

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

        self.repositoryInfoView.nameLabel.text        = viewModel.fullName
        self.repositoryInfoView.descriptionLabel.text = viewModel.repoDescription

        viewModel.repository.bind { [weak self] repository in
            guard let self = self else { return }
            self.repositoryInfoView.nameLabel.text        = repository?.fullName
            self.repositoryInfoView.descriptionLabel.text = repository?.repoDescription
        }

        setNeedsLayout()
    }

    private func setupViews() {
        self.accessoryType = .disclosureIndicator

        self.addSubview(repositoryInfoView)
        repositoryInfoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
