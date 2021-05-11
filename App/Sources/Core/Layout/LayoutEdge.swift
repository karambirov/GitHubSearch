//
//  LayoutEdge.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 16.03.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

struct LayoutEdge: OptionSet {
	let rawValue: UInt8
}

extension LayoutEdge {
	static let top = LayoutEdge(rawValue: 1 << 0)
	static let bottom = LayoutEdge(rawValue: 1 << 1)
	static let trailing = LayoutEdge(rawValue: 1 << 2)
	static let leading = LayoutEdge(rawValue: 1 << 3)
	static let left = LayoutEdge(rawValue: 1 << 4)
	static let right = LayoutEdge(rawValue: 1 << 5)
	static let none = LayoutEdge(rawValue: 1 << 6)
}
