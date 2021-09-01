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
			.scaledFont(for: .systemFont(ofSize: 15, weight: .regular))
	}

	private static var subheadline: UIFont {
		UIFontMetrics(forTextStyle: .subheadline)
			.scaledFont(for: .systemFont(ofSize: 15, weight: .semibold))
	}

	private static var headline: UIFont {
		UIFontMetrics(forTextStyle: .headline)
			.scaledFont(for: .systemFont(ofSize: 20, weight: .bold))
	}

	private static var largeTitle: UIFont {
		UIFontMetrics(forTextStyle: .largeTitle)
			.scaledFont(for: .systemFont(ofSize: 26, weight: .semibold))
	}
}

extension UIFont {

	enum Style {
		case regular
		case subheadline
		case headline
		case largeTitle
	}

	static func custom(style: Style) -> UIFont {
		switch style {
		case .regular:
			return regular
		case .subheadline:
			return subheadline
		case .headline:
			return headline
		case .largeTitle:
			return largeTitle
		}
	}
}
