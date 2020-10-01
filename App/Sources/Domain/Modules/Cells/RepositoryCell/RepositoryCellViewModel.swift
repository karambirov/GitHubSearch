//
//  RepositoryCellViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 19/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class RepositoryCellViewModel {

    var repository = Observable<Repository>()
    var fullName: String?
    var repoDescription: String?

    init(repository: Repository) {
        self.repository.value = repository
        self.fullName         = repository.fullName
        self.repoDescription  = repository.repoDescription
    }

}
