//
//  ViewControllerPresentationStyle.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import enum UIKit.UIModalPresentationStyle
import protocol UIKit.UIViewControllerTransitioningDelegate

enum ViewControllerPresentationStyle {

	case push
	case modal(UIModalPresentationStyle)
	case custom(UIViewControllerTransitioningDelegate)
}

extension ViewControllerPresentationStyle: Equatable {

	static func == (lhs: ViewControllerPresentationStyle, rhs: ViewControllerPresentationStyle) -> Bool {
		switch (lhs, rhs) {
		case (let .modal(presetationStyle1), let .modal(presetationStyle2)):
			return presetationStyle1 == presetationStyle2
		case (.push, .push):
			return true
		default:
			return false
		}
	}
}
