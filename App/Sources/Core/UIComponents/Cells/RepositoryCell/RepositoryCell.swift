//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RepositoryCell: UITableViewCell {

    private var viewModel: RepositoryCellViewModel?
	private lazy var repositoryInfoView = RepositoryInfoView(repository: Repository())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

	@available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel?.repository.observer = nil
    }
}

extension RepositoryCell {

    func setup(with viewModel: RepositoryCellViewModel) {
        self.viewModel = viewModel

        viewModel.repository.bind { [weak self] repository in
            guard let self = self, let repository = repository else { return }
			self.repositoryInfoView.update(with: repository)
        }

        setNeedsLayout()
    }
}

private extension RepositoryCell {

	func setupViews() {
		accessoryType = .disclosureIndicator
		contentView.addSubview(repositoryInfoView)
		repositoryInfoView.edgesToSuperview(insets: .uniform(16))
		repositoryInfoView.height(50, relation: .equalOrGreater)
	}
}
