//
//  DetailsViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class DetailsRouter: Router<DetailsViewController> {
    typealias Routes = Closable
}

final class DetailsViewModel {

    let repository: Repository
    let router: DetailsRouter.Routes

    init(repository: Repository, router: DetailsRouter.Routes) {
        self.repository = repository
        self.router = router
    }

}
