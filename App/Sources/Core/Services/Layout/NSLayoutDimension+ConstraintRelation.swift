//
//  NSLayoutDimension+ConstraintRelation.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension NSLayoutDimension {

	func constraint(
		to dimension: NSLayoutDimension,
		multiplier: CGFloat,
		offset: CGFloat,
		relation: ConstraintRelation
	) -> NSLayoutConstraint {

		switch relation {
		case .equal: return constraint(equalTo: dimension, multiplier: multiplier, constant: offset)
		case .equalOrLess: return constraint(lessThanOrEqualTo: dimension, multiplier: multiplier, constant: offset)
		case .equalOrGreater: return constraint(greaterThanOrEqualTo: dimension, multiplier: multiplier, constant: offset)
		}
	}

	func constraint(toConstant constant: CGFloat, relation: ConstraintRelation) -> NSLayoutConstraint {
		switch relation {
		case .equal: return constraint(equalToConstant: constant)
		case .equalOrLess: return constraint(lessThanOrEqualToConstant: constant)
		case .equalOrGreater: return constraint(greaterThanOrEqualToConstant: constant)
		}
	}
}
