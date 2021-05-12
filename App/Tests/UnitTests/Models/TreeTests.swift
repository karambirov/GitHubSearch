//
//  TreeTests.swift
//  GitHubSearchUnitTests
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import XCTest
@testable import GitHubSearch

final class TreeTests: XCTestCase {

	private lazy var tree: Tree<Int> = {
		let value1 = 1
		let value2 = 2
		let value3 = 3
		let value4 = 4
		let value5 = 5

		return .node(value1, next:
			.fork(value2, children: [
				.node(value3, next: .leaf(value4)),
				.leaf(value5)
			], selectedChildIndex: 0)
		)
	}()

	func testSelectedBranchBuilding() {
		XCTAssertEqual(tree.selectedBranch, [1, 2, 3, 4])
		XCTAssertEqual(tree.allValues, [1, 2, 3, 4, 5])
	}

	func testLinkedListBuildingFromArray() {
		let branch = Tree<Int>.branch(from: [1, 2, 3, 4, 5], mapLast: { .leaf($0) })

		XCTAssertEqual(
			branch?.debugDescription,
			Tree<Int>.node(1, next: .node(2, next: .node(3, next: .node(4, next: .leaf(5))))).debugDescription
		)
	}

	func testPathFinding() {
		XCTAssertNil(tree.path(to: 0))
		XCTAssertEqual(tree.path(to: 1), [.direct(1)])
		XCTAssertEqual(tree.path(to: 5), [.direct(1), .direct(2), .switch(5, index: 1)])
		XCTAssertEqual(tree.path(to: 4), [.direct(1), .direct(2), .switch(3, index: 0), .direct(4)])
	}

	func testLCAFinding() {
		XCTAssertNil(tree.findLCA(0, 1))
		XCTAssertNil(tree.findLCA(0, 0))
		XCTAssertEqual(tree.findLCA(1, 1), 1)
		XCTAssertEqual(tree.findLCA(1, 2), 1)
		XCTAssertEqual(tree.findLCA(5, 4), 2)
		XCTAssertEqual(tree.findLCA(5, 3), 2)
		XCTAssertEqual(tree.findLCA(5, 1), 1)
	}
}
