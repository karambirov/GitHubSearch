//
//  SearchResultCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class SearchResultCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repository: Repository? {
        didSet {
            nameLabel.text = repository?.fullName
            ownerLabel.text = repository?.owner.login
            descriptionLabel.text = repository?.description
        }
    }
    
}
