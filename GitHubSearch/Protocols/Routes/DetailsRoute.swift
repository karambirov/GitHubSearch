//
//  DetailsRoute.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

protocol DetailsRoute {

    var detailsTransition: Transition { get }
    func openDetails(for repository: Repository)

}

extension DetailsRoute where Self: RouterProtocol {

    var detailsTransition: Transition {
        return PushTransition()
    }

    func openDetails(for repository: Repository) {
        let router = DetailsRouter()
        let detailsViewModel = DetailsViewModel(repository: repository, router: router)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        router.viewController = detailsViewController

        let transition = detailsTransition
        router.openTransition = transition
        open(detailsViewController, transition: transition)
    }

}
