//
//  UIColor+Hex.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 30.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIColor {

	convenience init(rgbValue: Int, alpha: CGFloat = 1) {
		self.init(
			red: CGFloat((rgbValue >> 16) & 0xFF) / 255,
			green: CGFloat((rgbValue >> 8) & 0xFF) / 255,
			blue: CGFloat((rgbValue & 0xFF)) / 255,
			alpha: alpha
		)
	}
}
