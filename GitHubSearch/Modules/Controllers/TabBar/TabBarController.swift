//
//  TabBarController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Properties
    fileprivate var viewModel = TabBarViewModel()

    // MARK: - View Controller's life cycle
    init(items: [TabBarViewModel.TabBarItem]) {
        super.init(nibName: nil, bundle: nil)
        set(items: items)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

// MARK: - Setup
extension TabBarController {

    fileprivate func tabBarItem(for itemType: TabBarViewModel.TabBarItem) -> UIViewController {
        let controller = itemType.viewController
        controller.tabBarItem = itemType.tabBarItem
        return controller
    }

    fileprivate func set(items: [TabBarViewModel.TabBarItem]) {
        guard viewControllers?.count != items.count else { return }
        viewControllers = items.map { tabBarItem(for: $0) }
    }

}
