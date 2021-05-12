//
//  RouteMock.swift
//  GitHubSearchUnitTests
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

@testable import GitHubSearch

enum RouteMock: String {

	case page1
	case page2
}

extension RouteMock: NavigationTagProtocol {

	var value: String { self.rawValue }

	init?(value: String) {
		self.init(rawValue: value)
	}
}
