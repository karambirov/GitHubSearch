//
//  Constraints.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 16.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

typealias Constraint = NSLayoutConstraint
typealias Constraints = [NSLayoutConstraint]

enum ConstraintRelation: Int {
	
	case equal = 0
	case equalOrLess = -1
	case equalOrGreater = 1
}

extension Collection where Iterator.Element == Constraint {

	func activate() {
		if let constaints = self as? Constraints {
			Constraint.activate(constaints)
		}
	}

	func deactivate() {
		if let constaints = self as? Constraints {
			Constraint.deactivate(constaints)
		}
	}
}

extension Constraint {

	@objc
	func with(_ p: UILayoutPriority) -> Self {
		priority = p
		return self
	}

	func set(_ active: Bool) -> Self {
		isActive = active
		return self
	}
}
