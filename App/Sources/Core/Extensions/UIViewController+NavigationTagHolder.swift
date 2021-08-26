//
//  UIViewController+NavigationTagHolder.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

private enum AssociatedKeys {

	static var tag = 0
}

extension UIViewController: NavigationTagHolder {

	public var navigationTag: String? {
		get {
			return objc_getAssociatedObject(self, &AssociatedKeys.tag) as? String
		}

		set {
			objc_setAssociatedObject(
				self,
				&AssociatedKeys.tag,
				newValue,
				objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
			)
		}
	}
}
