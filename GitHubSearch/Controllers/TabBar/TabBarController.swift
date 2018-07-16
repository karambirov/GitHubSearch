//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/02/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

private enum Constants {
    static let nibName = "TabBarController"
}

final class TabBarController: UITabBarController {

    // MARK: - ViewController's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

}

extension TabBarController {
    
    fileprivate func initialSetup() {
        let search = SearchViewController.instantiateFromNib().embedInNavigationController()
        search.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        viewControllers = [search]
    }
    
}

