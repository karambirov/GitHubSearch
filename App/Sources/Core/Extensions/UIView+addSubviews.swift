//
//  UIView+addSubviews.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 27.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIView {

	func addSubviews(_ views: UIView...) {
		views.forEach { view in addSubview(view) }
	}
}
