//
//  TabBarViewModel.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class TabBarViewModel {

    enum TabBarItem {
        case search
        case favorites
    }

}

extension TabBarViewModel.TabBarItem {

    var viewController: UIViewController {
        switch self {
        case .search:
            return UINavigationController(rootViewController: SearchViewController())
        case .favorites:
            return UINavigationController(rootViewController: FavoritesViewController())
        }
    }

    var tabBarItem: UITabBarItem {
        switch self {
        case .search:
            return UITabBarItem(tabBarSystemItem: .search, tag: 0)
        case .favorites:
            return UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        }
    }

}
