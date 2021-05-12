//
//  NavigationTagProtocol.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol NavigationTagProtocol: Hashable, CustomStringConvertible {

	var value: String { get }

	init?(value: String)
}

extension NavigationTagProtocol {

	var description: String { self.value }
}

extension NavigationTagProtocol where Self: RawRepresentable, RawValue == String {

	var value: String { self.rawValue }

	init?(value: String) {
		self.init(rawValue: value)
	}
}
