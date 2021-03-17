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
			view.translatesAutoresizingMaskIntoConstraints = false
			addSubview(view)

			switch axis {
			case .vertical:
				constraints.append(view.top(to: previous ?? self, previous?.bottomAnchor ?? topAnchor, offset: offset))
				constraints.append(view.leftToSuperview())
				constraints.append(view.rightToSuperview())

				if let lastView = views.last, view == lastView {
					constraints.append(view.bottomToSuperview())
				}

			case .horizontal:
				constraints.append(view.topToSuperview())
				constraints.append(view.bottomToSuperview())
				constraints.append(view.left(to: previous ?? self, previous?.rightAnchor ?? leftAnchor, offset: offset))

				if let lastView = views.last, view == lastView {
					constraints.append(view.rightToSuperview())
				}

			@unknown default:
				fatalError()
			}

			if let width = width {
				constraints.append(view.width(width))
			}

			if let height = height {
				constraints.append(view.height(height))
			}

			offset = spacing
			previous = view
		}
		return constraints
	}
}
