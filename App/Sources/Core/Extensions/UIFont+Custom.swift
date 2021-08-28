//
//  UIFont+Custom.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 27.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIFont {

	private static var regular: UIFont {
		UIFontMetrics(forTextStyle: .body)
			.scaledFont(for: .systemFont(ofSize: 14, weight: .regular))
	}

	private static var headline: UIFont {
		UIFontMetrics(forTextStyle: .headline)
			.scaledFont(for: .systemFont(ofSize: 14, weight: .semibold))
	}
}

extension UIFont {

	enum Style {
		case regular
		case headline
	}

	static func custom(style: Style) -> UIFont {
		switch style {
		case .regular:
			return regular
		case .headline:
			return headline
		}
	}
}
