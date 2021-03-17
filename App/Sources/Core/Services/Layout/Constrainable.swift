//
//  Constrainable.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 16.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol Constrainable {
	
	var topAnchor: NSLayoutYAxisAnchor { get }
	var bottomAnchor: NSLayoutYAxisAnchor { get }
	var leftAnchor: NSLayoutXAxisAnchor { get }
	var rightAnchor: NSLayoutXAxisAnchor { get }
	var leadingAnchor: NSLayoutXAxisAnchor { get }
	var trailingAnchor: NSLayoutXAxisAnchor { get }

	var centerXAnchor: NSLayoutXAxisAnchor { get }
	var centerYAnchor: NSLayoutYAxisAnchor { get }

	var widthAnchor: NSLayoutDimension { get }
	var heightAnchor: NSLayoutDimension { get }

	@discardableResult
	func prepareForLayout() -> Self
}

extension UIView: Constrainable {

	@discardableResult
	func prepareForLayout() -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		return self
	}
}

extension UILayoutGuide: Constrainable {

	@discardableResult
	func prepareForLayout() -> Self {
		return self
	}
}
