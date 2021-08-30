//
//  UIImage+SFSymbols.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 30.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIImage {

	static func sfSymbol(_ symbol: SFSymbol) -> UIImage? {
		UIImage(systemName: symbol.rawValue)
	}
}

extension UIImage {

	enum SFSymbol: String {
		case star = "star"
		case circleFill = "circle.fill"
	}
}
