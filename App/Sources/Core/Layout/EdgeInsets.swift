//
//  EdgeInsets.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 16.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
	UIEdgeInsets(
		top: lhs.top + rhs.top,
		left: lhs.left + rhs.left,
		bottom: lhs.bottom + rhs.bottom,
		right: lhs.right + rhs.right
	)
}

extension UIEdgeInsets {
	@discardableResult
	static func uniform(_ value: CGFloat) -> Self {
		UIEdgeInsets(top: value, left: value, bottom: value, right: value)
	}

	@discardableResult
	static func top(_ value: CGFloat) -> Self {
		UIEdgeInsets(top: value, left: 0, bottom: 0, right: 0)
	}

	@discardableResult
	static func left(_ value: CGFloat) -> Self {
		UIEdgeInsets(top: 0, left: value, bottom: 0, right: 0)
	}

	@discardableResult
	static func bottom(_ value: CGFloat) -> Self {
		UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)
	}

	@discardableResult
	static func right(_ value: CGFloat) -> Self {
		UIEdgeInsets(top: 0, left: 0, bottom: 0, right: value)
	}

	@discardableResult
	static func horizontal(_ value: CGFloat) -> Self {
		UIEdgeInsets(top: 0, left: value, bottom: 0, right: value)
	}

	@discardableResult
	static func vertical(_ value: CGFloat) -> Self {
		UIEdgeInsets(top: value, left: 0, bottom: value, right: 0)
	}
}
