//
//  Weak.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

struct Weak<T> {

	private weak var value: AnyObject?

	init(value: T) {
		self.value = value as AnyObject
	}

	func get() -> T? {
		return self.value as? T
	}
}
