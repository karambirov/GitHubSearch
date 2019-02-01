//
//  FavoritesViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class FavoritesRouter: Router<FavoritesViewController>, FavoritesRouter.Routes {
    typealias Routes = DetailsRoute
}

final class FavoritesViewModel {

    var repositories: [Repository]?
    let router: FavoritesRouter.Routes

    init(router: FavoritesRouter.Routes) {
        self.router = router
    }

}
