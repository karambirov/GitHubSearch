//
//  GroupTests.swift
//  GitHubSearchUnitTests
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import XCTest
@testable import GitHubSearch

final class GroupTests: XCTestCase {

	func testAppendingMethod() {
		var group: Group<Int> = .single(1)
		XCTAssertFalse(group.contains(2))
		XCTAssertEqual(group.top, 1)
		XCTAssertEqual(group.bottom, 1)

		group = group.appending(2)
		XCTAssertTrue(group.contains(2))
		XCTAssertFalse(group.contains(3))
		XCTAssertEqual(group.top, 2)
		XCTAssertEqual(group.bottom, 1)

		group = group.appending(3)
		XCTAssertTrue(group.contains(3))
		XCTAssertEqual(group.top, 3)
		XCTAssertEqual(group.bottom, 1)
	}

	func testContainsMethod() {
		let group: Group<Int> = .group([1, 2, 3], bottom: 4, top: 5)
		let single: Group<Int> = .single(1)

		XCTAssertTrue(group.contains(1))
		XCTAssertTrue(group.contains(2))
		XCTAssertTrue(group.contains(4))
		XCTAssertTrue(group.contains(4))
		XCTAssertTrue(group.contains(5))
		XCTAssertFalse(group.contains(6))

		XCTAssertTrue(single.contains(1))
		XCTAssertFalse(single.contains(2))
	}
}
