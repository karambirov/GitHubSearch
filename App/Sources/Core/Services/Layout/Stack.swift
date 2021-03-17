//
//  Stack.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 16.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIView {

	func stack(
		_ views: [UIView],
		axis: NSLayoutConstraint.Axis = .vertical,
		width: CGFloat? = nil,
		height: CGFloat? = nil,
		spacing: CGFloat = 0
	) -> Constraints {

		translatesAutoresizingMaskIntoConstraints = false

		var offset: CGFloat = 0
		var previous: UIView?
		var constraints: Constraints = []

		for view in views {
			translatesAutoresizingMaskIntoConstraints = false
			addSubview(view)

//			switch axis {
//			case .vertical:
//				constraints.append(view.top)
//
//			case .horizontal:
//
//			@unknown default:
//				break
//			}
//		}

		return constraints
	}
}
