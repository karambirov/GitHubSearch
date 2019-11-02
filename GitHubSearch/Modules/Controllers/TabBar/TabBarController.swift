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
    private var viewModel: TabBarViewModel

    // MARK: - View Controller's life cycle
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        set(items: viewModel.items)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup
private extension TabBarController {

    func tabBarItem(for itemType: TabBarViewModel.TabBarItem) -> UIViewController {
        let controller = itemType.viewController
        controller.tabBarItem = itemType.tabBarItem
        return controller
    }

    func set(items: [TabBarViewModel.TabBarItem]) {
        guard viewControllers?.count != items.count else { return }
        viewControllers = items.map { tabBarItem(for: $0) }
    }

}
