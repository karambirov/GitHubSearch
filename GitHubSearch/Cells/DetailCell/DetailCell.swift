//
//  DetailCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 07/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class DetailCell: UITableViewCell {

    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerEmailLabel: UILabel!
    @IBOutlet weak var repoFullNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    
    var repository: Repository? {
        didSet {
            ownerImage.image = UIImage()
            ownerNameLabel.text = repository?.owner.name
            ownerEmailLabel.text = repository?.owner.email
            repoFullNameLabel.text = repository?.fullName
            repoDescriptionLabel.text = repository?.description
        }
    }
    
}
