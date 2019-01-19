//
//  RepositoryCell.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RepositoryCell: UITableViewCell, Describable {

    // MARK: - Properties
    var repository: Repository? {
        didSet {
            // Setup labels
        }
    }

}
