//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 16/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RepositoryCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var ownerLabel: UILabel!
    @IBOutlet fileprivate weak var descriptionLabel: UILabel!

    //MARK: - Properties
    var repository: Repository? {
        didSet {
            nameLabel.text          = repository?.fullName
            ownerLabel.text         = repository?.owner?.login
            descriptionLabel.text   = repository?.repoDescription
        }
    }

}
