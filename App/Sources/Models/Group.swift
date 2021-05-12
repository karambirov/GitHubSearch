//
//  Group.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

enum Group<Value> {

	case single(Value)
	case group([Value], bottom: Value, top: Value)
}

extension Group {

	var top: Value {
		switch self {
		case .single(let value):
			return value
		case .group(_, _, let value):
			return value
		}
	}

	var bottom: Value {
		switch self {
		case .single(let value):
			return value
		case .group(_, let value, _):
			return value
		}
	}

	func appending(_ value: Value) -> Group {
		switch self {
		case .single(let bottom):
			return .group([], bottom: bottom, top: value)
		case .group(let values, let bottom, let top):
			return .group(values + [top], bottom: bottom, top: value)
		}
	}

	func contains(where predicate: (Value) -> Bool) -> Bool {
		switch self {
		case .single(let value):
			return predicate(value)
		case .group(let values, let bottom, let top):
			return predicate(bottom)
				|| predicate(top)
				|| values.contains(where: predicate)
		}
	}
}

extension Group where Value: Equatable {

	func contains(_ value: Value) -> Bool {
		return self.contains { $0 == value }
	}
}
