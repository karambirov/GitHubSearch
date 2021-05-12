//
//  Tree.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

enum Tree<Value> {

	case leaf(Value)
	indirect case node(Value, next: Tree)
	indirect case fork(Value, children: [Tree], selectedChildIndex: Int)
}

extension Tree {

	typealias Predicate = (Value) -> Bool

	var value: Value {
		switch self {
		case .leaf(let value),
			 .node(let value, _),
			 .fork(let value, _, _):
			return value
		}
	}

	var allValues: [Value] {
		switch self {
		case .leaf(let value):
			return [value]
		case .node(let value, let next):
			return [value] + next.allValues
		case .fork(let value, let children, _):
			return [value] + children.flatMap { $0.allValues }
		}
	}

	var selectedBranch: [Value] {
		switch self {
		case .leaf(let value):
			return [value]
		case .node(let value, let next):
			return [value] + next.selectedBranch
		case .fork(let value, let children, let selectedChildIndex):
			return [value] + children[selectedChildIndex].selectedBranch
		}
	}

	static func branch(from values: [Value], mapLast: (Value) -> Tree?) -> Tree? {
		guard values.isEmpty == false else { return nil }

		var values = values
		let first = values.removeFirst()

		if let branch = self.branch(from: values, mapLast: mapLast) {
			return .node(first, next: branch)
		} else {
			return mapLast(first)
		}
	}

	func path(to predicate: Predicate) -> [PathNode]? {
		if predicate(self.value) {
			return [.direct(self.value)]
		}

		switch self {
		case .node(_, let next):
			if let path = next.path(to: predicate) {
				return [.direct(self.value)] + path
			}
		case .fork(_, let children, _):
			for (index, child) in children.enumerated() {
				if let path = child.path(to: predicate) {
					return [.switch(self.value, index: index)] + path
				}
			}
		default: break
		}

		return nil
	}

	func search(where predicate: Predicate) -> Value? {
		return self.allValues.first(where: predicate)
	}

	func contains(where predicate: Predicate) -> Bool {
		return self.search(where: predicate) != nil
	}
}

extension Tree {

	enum PathNode {

		case direct(Value)
		case `switch`(Value, index: Int)
	}
}

extension Tree.PathNode {

	var value: Value {
		switch self {
		case .direct(let value):
			return value
		case .switch(let value, _):
			return value
		}
	}
}

extension Tree.PathNode: Equatable where Value: Equatable {

	static func == (lhs: Tree.PathNode, rhs: Tree.PathNode) -> Bool {
		return lhs.value == rhs.value
	}
}

extension Tree where Value: Equatable {

	func path(to value: Value) -> [PathNode]? {
		return self.path { $0 == value }
	}

	func findLCA(_ value1: Value, _ value2: Value) -> Value? {
		// поиск LCA идет за O(2*n), но можно сделать за O(n),
		// если использовать для дерева подобную структуру:
		// class TreeNode<T> { let value: T; let parent: TreeNode<T>?; ... }
		guard
			let path1 = self.path(to: value1),
			let path2 = self.path(to: value2)
		else {
			return nil
		}

		let minCount = min(path1.count, path2.count)

		for index in 0..<minCount + 1 where index >= minCount || path1[index] != path2[index] {
			return path1[0..<index].last?.value
		}

		return nil
	}

	func contains(_ value: Value) -> Bool {
		return self.contains { $0 == value }
	}
}

extension Tree: CustomDebugStringConvertible {

	var debugDescription: String {
		let address = String(format: "%p", unsafeBitCast(self.value, to: Int.self))
		let description = "- " + String(describing: type(of: self.value)) + " (\(address))"

		switch self {
		case .leaf:
			return description
		case .node(_, let next):
			return description + "\n" + next.tabbedDescription
		case .fork(_, let children, let selectedChildIndex):
			return description + " \(selectedChildIndex)\n" + children
				.map { $0.tabbedDescription }
				.joined(separator: "\n")
		}
	}

	private var tabbedDescription: String {
		return self.debugDescription
			.split(separator: "\n")
			.map { "\t" + $0 }
			.joined(separator: "\n")
	}
}
