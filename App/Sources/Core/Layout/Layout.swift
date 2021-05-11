//
//  Layout.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 16.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension Constrainable {

	@discardableResult
	func top(
		to view: Constrainable,
		_ anchor: NSLayoutYAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return topAnchor
			.constraint(to: anchor ?? view.topAnchor, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func bottom(
		to view: Constrainable,
		_ anchor: NSLayoutYAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return bottomAnchor
			.constraint(to: anchor ?? view.bottomAnchor, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func left(
		to view: Constrainable,
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return leftAnchor
			.constraint(to: anchor ?? view.leftAnchor, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
		}

	@discardableResult
	func right(
		to view: Constrainable,
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return rightAnchor
			.constraint(to: anchor ?? view.rightAnchor, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func leftToRight(
		of view: Constrainable,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return left(
			to: view,
			view.rightAnchor,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}

	@discardableResult
	func rightToLeft(
		of view: Constrainable,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return right(
			to: view,
			view.leftAnchor,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}

	@discardableResult
	func topToBottom(
		of view: Constrainable,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return top(
			to: view,
			view.bottomAnchor,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}

	@discardableResult
	func bottomToTop(
		of view: Constrainable,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return bottom(
			to: view,
			view.topAnchor,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}
}

extension Constrainable {

	@discardableResult
	func leading(
		to view: Constrainable,
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return leadingAnchor
			.constraint(to: anchor ?? view.leadingAnchor, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func leadingToTrailing(
		of view: Constrainable,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return leading(
			to: view, view.trailingAnchor,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}
}

extension Constrainable {

	@discardableResult
	func trailing(
		to view: Constrainable,
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return trailingAnchor
			.constraint(to: anchor ?? view.trailingAnchor, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func trailingToLeading(
		of view: Constrainable,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return trailing(
			to: view,
			view.leadingAnchor,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}
}

extension Constrainable {

	@discardableResult
	func center(
		in view: Constrainable,
		offset: CGPoint = .zero,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraints {

		prepareForLayout()

		let constraints = [
			centerX(to: view, offset: offset.x, priority: priority, isActive: isActive),
			centerY(to: view, offset: offset.y, priority: priority, isActive: isActive)
		]

		return constraints
	}

	@discardableResult
	func centerX(
		to view: Constrainable,
		_ anchor: NSLayoutXAxisAnchor? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		var constraint: Constraint {
			if let anchor = anchor {
				return centerXAnchor.constraint(equalTo: anchor, constant: offset).with(priority)
			} else {
				return Constraint(
					item: self,
					attribute: .centerX,
					relatedBy: .equal,
					toItem: view,
					attribute: .centerX,
					multiplier: multiplier,
					constant: offset
				)
				.with(priority)
			}
		}

		constraint.isActive = isActive
		return constraint
	}

	@discardableResult
	func centerY(
		to view: Constrainable,
		_ anchor: NSLayoutYAxisAnchor? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		var constraint: Constraint {
			if let anchor = anchor {
				return centerYAnchor.constraint(equalTo: anchor, constant: offset).with(priority)
			} else {
				return Constraint(
					item: self,
					attribute: .centerY,
					relatedBy: .equal,
					toItem: view,
					attribute: .centerY,
					multiplier: multiplier,
					constant: offset
				)
				.with(priority)
			}
		}

		constraint.isActive = isActive
		return constraint
	}
}

extension Constrainable {

	@discardableResult
	func edges(
		to view: Constrainable,
		excluding excludedEdge: LayoutEdge = .none,
		insets: UIEdgeInsets = .zero,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraints {

		prepareForLayout()

		var constraints: Constraints = []

		if excludedEdge.contains(.top) == false {
			constraints.append(
				top(to: view, offset: insets.top, relation: relation, priority: priority, isActive: isActive)
			)
		}

		if excludedEdge.contains(.left) == false {
			constraints.append(
				left(to: view, offset: insets.left, relation: relation, priority: priority, isActive: isActive)
			)
		}

		if excludedEdge.contains(.bottom) == false {
			constraints.append(
				bottom(to: view, offset: -insets.bottom, relation: relation, priority: priority, isActive: isActive)
			)
		}

		if excludedEdge.contains(.right) == false {
			constraints.append(
				right(to: view, offset: -insets.right, relation: relation, priority: priority, isActive: isActive)
			)
		}

		return constraints
	}

	@discardableResult
	func origin(
		to view: Constrainable,
		insets: UIEdgeInsets = .zero,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraints {

		prepareForLayout()

		let constraints = [
			left(to: view, offset: insets.left, relation: relation, priority: priority, isActive: isActive),
			top(to: view, offset: insets.top, relation: relation, priority: priority, isActive: isActive)
		]

		return constraints
	}
}

extension Constrainable {

	@discardableResult
	func width(
		_ width: CGFloat,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return widthAnchor
			.constraint(toConstant: width, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func width(
		to view: Constrainable,
		_ dimension: NSLayoutDimension? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return widthAnchor
			.constraint(to: dimension ?? view.widthAnchor, multiplier: multiplier, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func widthToHeight(
		of view: Constrainable,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		return width(
			to: view,
			view.heightAnchor,
			multiplier: multiplier,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}

	@discardableResult
	func width(
		min: CGFloat? = nil,
		max: CGFloat? = nil,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraints {

		prepareForLayout()

		var constraints: Constraints = []

		if let min = min {
			let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: min).with(priority)
			constraint.isActive = isActive
			constraints.append(constraint)
		}

		if let max = max {
			let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: max).with(priority)
			constraint.isActive = isActive
			constraints.append(constraint)
		}

		return constraints
	}

}

extension Constrainable {

	@discardableResult
	func height(
		_ height: CGFloat,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return heightAnchor
			.constraint(toConstant: height, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func height(
		to view: Constrainable,
		_ dimension: NSLayoutDimension? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		prepareForLayout()

		return heightAnchor
			.constraint(to: dimension ?? view.heightAnchor, multiplier: multiplier, offset: offset, relation: relation)
			.with(priority)
			.set(isActive)
	}

	@discardableResult
	func heightToWidth(
		of view: Constrainable,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		return height(
			to: view,
			view.widthAnchor,
			multiplier: multiplier,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}

	@discardableResult
	func height(
		min: CGFloat? = nil,
		max: CGFloat? = nil,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraints {

		prepareForLayout()

		var constraints: Constraints = []

		if let min = min {
			let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: min).with(priority)
			constraint.isActive = isActive
			constraints.append(constraint)
		}

		if let max = max {
			let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: max).with(priority)
			constraint.isActive = isActive
			constraints.append(constraint)
		}

		return constraints
	}
}

extension Constrainable {

	@discardableResult
	func size(
		_ size: CGSize,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraints {

		prepareForLayout()

		let constraints = [
			width(size.width, relation: relation, priority: priority, isActive: isActive),
			height(size.height, relation: relation, priority: priority, isActive: isActive)
		]

		return constraints
	}

	@discardableResult
	func size(
		to view: Constrainable,
		multiplier: CGFloat = 1,
		insets: CGSize = .zero,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraints {

		prepareForLayout()

		let constraints = [
			width(
				to: view,
				multiplier: multiplier,
				offset: insets.width,
				relation: relation,
				priority: priority,
				isActive: isActive
			),
			height(
				to: view,
				multiplier: multiplier,
				offset: insets.height,
				relation: relation,
				priority: priority,
				isActive: isActive
			)
		]

		return constraints
	}

	@discardableResult
	func aspectRatio(
		_ ratio: CGFloat,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true
	) -> Constraint {

		return widthToHeight(
			of: self,
			multiplier: ratio,
			offset: 0,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}
}

extension UIView {

	func setHugging(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
		setContentHuggingPriority(priority, for: axis)
	}

	func setCompressionResistance(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
		setContentCompressionResistancePriority(priority, for: axis)
	}
}
