//
//  Layout+Superview.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIView {

	@discardableResult
	func leftToSuperview(
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return left(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
	}

	@discardableResult
	func rightToSuperview(
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return right(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
	}

	@discardableResult
	func topToSuperview(
		_ anchor: NSLayoutYAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return top(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
	}

	@discardableResult
	func bottomToSuperview(
		_ anchor: NSLayoutYAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return bottom(to: constrainable, anchor, offset: offset, relation: relation, priority: priority, isActive: isActive)
	}
}

extension UIView {

	@discardableResult
	func leadingToSuperview(
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)

		if effectiveUserInterfaceLayoutDirection == .rightToLeft {
			return leading(
				to: constrainable,
				anchor,
				offset: -offset,
				relation: relation,
				priority: priority,
				isActive: isActive
			)
		} else {
			return leading(
				to: constrainable,
				anchor,
				offset: offset,
				relation: relation,
				priority: priority,
				isActive: isActive
			)
		}
	}
}

extension UIView {

	@discardableResult
	func trailingToSuperview(
		_ anchor: NSLayoutXAxisAnchor? = nil,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)

		if effectiveUserInterfaceLayoutDirection == .rightToLeft {
			return trailing(
				to: constrainable,
				anchor,
				offset: offset,
				relation: relation,
				priority: priority,
				isActive: isActive
			)
		} else {
			return trailing(
				to: safeAreaLayoutGuide,
				anchor,
				offset: -offset,
				relation: relation,
				priority: priority,
				isActive: isActive
			)
		}
	}
}

extension UIView {

	@discardableResult
	func horizontalToSuperview(
		insets: UIEdgeInsets = .zero,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraints {

		var constraints = Constraints()

		if effectiveUserInterfaceLayoutDirection == .leftToRight {
			constraints.append(
				leftToSuperview(
					offset: insets.left,
					relation: relation,
					priority: priority,
					isActive: isActive,
					usingSafeArea: usingSafeArea
				)
			)
			constraints.append(
				rightToSuperview(
					offset: -insets.right,
					relation: relation,
					priority: priority,
					isActive: isActive,
					usingSafeArea: usingSafeArea
				)
			)
		} else {
			constraints.append(
				rightToSuperview(
					offset: -insets.right,
					relation: relation,
					priority: priority,
					isActive: isActive,
					usingSafeArea: usingSafeArea
				)
			)
			constraints.append(
				leftToSuperview(
					offset: insets.left,
					relation: relation,
					priority: priority,
					isActive: isActive,
					usingSafeArea: usingSafeArea
				)
			)
		}

		return constraints
	}
}

extension UIView {

	@discardableResult
	func verticalToSuperview(
		insets: UIEdgeInsets = .zero,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraints {

		let constraints = [
			topToSuperview(
				offset: insets.top,
				relation: relation,
				priority: priority,
				isActive: isActive,
				usingSafeArea: usingSafeArea
			),
			bottomToSuperview(
				offset: -insets.bottom,
				relation: relation,
				priority: priority,
				isActive: isActive,
				usingSafeArea: usingSafeArea
			)
		]

		return constraints
	}
}

extension UIView {

	@discardableResult
	func centerInSuperview(
		offset: CGPoint = .zero,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraints {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return center(in: constrainable, offset: offset, priority: priority, isActive: isActive)
	}

	@discardableResult
	func centerXToSuperview(
		_ anchor: NSLayoutXAxisAnchor? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return centerX(to: constrainable, anchor, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
	}

	@discardableResult
	func centerYToSuperview(
		_ anchor: NSLayoutYAxisAnchor? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return centerY(to: constrainable, anchor, multiplier: multiplier, offset: offset, priority: priority, isActive: isActive)
	}
}

extension UIView {

	@discardableResult
	func edgesToSuperview(
		excluding excludedEdge: LayoutEdge = .none,
		insets: UIEdgeInsets = .zero,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraints {

		var constraints = Constraints()

		if !excludedEdge.contains(.top) {
			constraints.append(
				topToSuperview(
					offset: insets.top,
					relation: relation,
					priority: priority,
					isActive: isActive,
					usingSafeArea: usingSafeArea
				)
			)
		}

		if effectiveUserInterfaceLayoutDirection == .leftToRight {

			if !(excludedEdge.contains(.leading) || excludedEdge.contains(.left)) {
				constraints.append(
					leftToSuperview(
						offset: insets.left,
						relation: relation,
						priority: priority,
						isActive: isActive,
						usingSafeArea: usingSafeArea
					)
				)
			}

			if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.right)) {
				constraints.append(
					rightToSuperview(
						offset: -insets.right,
						relation: relation,
						priority: priority,
						isActive: isActive,
						usingSafeArea: usingSafeArea
					)
				)
			}

		} else {

			if !(excludedEdge.contains(.leading) || excludedEdge.contains(.right)) {
				constraints.append(
					rightToSuperview(
						offset: -insets.right,
						relation: relation,
						priority: priority,
						isActive: isActive,
						usingSafeArea: usingSafeArea
					)
				)
			}

			if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.left)) {
				constraints.append(
					leftToSuperview(
						offset: insets.left,
						relation: relation,
						priority: priority,
						isActive: isActive,
						usingSafeArea: usingSafeArea
					)
				)
			}
		}

		if !excludedEdge.contains(.bottom) {
			constraints.append(
				bottomToSuperview(
					offset: -insets.bottom,
					relation: relation,
					priority: priority,
					isActive: isActive,
					usingSafeArea: usingSafeArea
				)
			)
		}

		return constraints
	}

	@discardableResult
	func originToSuperview(
		insets: UIEdgeInsets = .zero,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraints {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return origin(to: constrainable, insets: insets, relation: relation, priority: priority, isActive: isActive)
	}
}

extension UIView {

	@discardableResult
	func widthToSuperview(
		_ dimension: NSLayoutDimension? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return width(
			to: constrainable,
			dimension,
			multiplier: multiplier,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}
}

extension UIView {

	@discardableResult
	func heightToSuperview(
		_ dimension: NSLayoutDimension? = nil,
		multiplier: CGFloat = 1,
		offset: CGFloat = 0,
		relation: ConstraintRelation = .equal,
		priority: UILayoutPriority = .required,
		isActive: Bool = true,
		usingSafeArea: Bool = false
	) -> Constraint {

		let constrainable = safeConstrainable(for: superview, usingSafeArea: usingSafeArea)
		return height(
			to: constrainable,
			dimension,
			multiplier: multiplier,
			offset: offset,
			relation: relation,
			priority: priority,
			isActive: isActive
		)
	}
}

private extension UIView {

	private func safeConstrainable(for superview: UIView?, usingSafeArea: Bool) -> Constrainable {

		guard let superview = superview else {
			fatalError("Unable to create this constraint to it's superview, because it has no superview.")
		}

		prepareForLayout()

		if #available(iOS 11, *) {
			if usingSafeArea {
				return superview.safeAreaLayoutGuide
			}
		}

		return superview
	}
}
