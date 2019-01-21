//
//  RepositoryCellViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 19/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

protocol RepositoryCellViewModelDelegate: AnyObject {
    func configure(with repository: Repository)
}

final class RepositoryCellViewModel {

    weak var delegate: RepositoryCellViewModelDelegate?

    var repository: Repository! {
        didSet {
            delegate?.configure(with: self.repository)
        }
    }

}
