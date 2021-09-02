//
//  UIButton+Localization.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 02.09.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIButton {

	func setTitle(_ title: Localization.Button, for state: UIControl.State) {
		self.setTitle(title.rawValue, for: state)
	}
}
