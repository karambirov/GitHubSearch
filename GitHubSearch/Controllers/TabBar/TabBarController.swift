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

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension TabBarController {
    
    static func instantiateFromNib() -> TabBarController {
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        let vc = nib.instantiate(withOwner: nil, options: nil).first as! TabBarController
        return vc
    }
    
}

