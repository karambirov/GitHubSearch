//
//  RootViewControllerHolder.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController

protocol RootViewControllerHolder: AnyObject {

	var rootViewController: UIViewController? { get set }
}
