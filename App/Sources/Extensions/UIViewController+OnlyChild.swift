//
//  UIViewController+OnlyChild.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIViewController {

	var onlyChild: UIViewController? {
		guard
			self.children.count == 1,
			self.view.subviews.count == 1,
			self.view.subviews.first == self.children.first?.view
		else {
			return nil
		}
		return self.children.first
	}
}
