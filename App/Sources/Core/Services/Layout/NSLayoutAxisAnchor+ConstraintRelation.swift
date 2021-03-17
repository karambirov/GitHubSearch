//
//  NSLayoutAxisAnchor+ConstraintRelation.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension NSLayoutXAxisAnchor {

	func constraint(to anchor: NSLayoutXAxisAnchor, relation: ConstraintRelation) -> NSLayoutConstraint {
		
		switch relation {
		case .equal: return constraint(equalTo: anchor)
		case .equalOrLess: return constraint(lessThanOrEqualTo: anchor)
		case .equalOrGreater: return constraint(greaterThanOrEqualTo: anchor)
		}
	}
}

extension NSLayoutYAxisAnchor {

	func constraint(to anchor: NSLayoutYAxisAnchor, relation: ConstraintRelation) -> NSLayoutConstraint {

		switch relation {
		case .equal: return constraint(equalTo: anchor)
		case .equalOrLess: return constraint(lessThanOrEqualTo: anchor)
		case .equalOrGreater: return constraint(greaterThanOrEqualTo: anchor)
		}
	}
}
