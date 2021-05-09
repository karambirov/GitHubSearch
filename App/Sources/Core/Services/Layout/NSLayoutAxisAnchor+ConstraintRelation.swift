//
//  NSLayoutAxisAnchor+ConstraintRelation.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension NSLayoutXAxisAnchor {

	func constraint(
		to anchor: NSLayoutXAxisAnchor,
		offset: CGFloat,
		relation: ConstraintRelation
	) -> NSLayoutConstraint {
		switch relation {
		case .equal: return constraint(equalTo: anchor, constant: offset)
		case .equalOrLess: return constraint(lessThanOrEqualTo: anchor, constant: offset)
		case .equalOrGreater: return constraint(greaterThanOrEqualTo: anchor, constant: offset)
		}
	}
}

extension NSLayoutYAxisAnchor {

	func constraint(
		to anchor: NSLayoutYAxisAnchor,
		offset: CGFloat,
		relation: ConstraintRelation
	) -> NSLayoutConstraint {
		switch relation {
		case .equal: return constraint(equalTo: anchor, constant: offset)
		case .equalOrLess: return constraint(lessThanOrEqualTo: anchor, constant: offset)
		case .equalOrGreater: return constraint(greaterThanOrEqualTo: anchor, constant: offset)
		}
	}
}
