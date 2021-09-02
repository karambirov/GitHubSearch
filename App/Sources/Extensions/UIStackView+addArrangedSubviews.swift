//
//  UIStackView+addArrangedSubviews.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 27.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIStackView {

	func addArrangedSubviews(_ views: UIView...) {
		views.forEach { view in addArrangedSubview(view) }
	}
}
