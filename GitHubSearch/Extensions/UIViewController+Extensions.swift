//
//  UIViewController+Extensions.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func embedInNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    // TODO: - Add generic method "instantiateFromNib()"
    
}

