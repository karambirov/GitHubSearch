//
//  ViewControllersStackGrouperTests.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import XCTest
@testable import GitHubSearch

final class ViewControllersStackGrouperTests: XCTestCase {

	private let grouper = ViewControllersStackGrouper()

	func testGrouping() {
		let vc1 = UIViewController()
		let vc2 = UIViewController()
		let vc3 = UITabBarController()
		let vc4 = UIViewController()
		let vc5 = UIViewController()
		let vc6 = UIViewController()
		let vc7 = UIViewController()
		let vc8 = UIViewController()
		let vc9 = UITabBarController()
		let vc10 = UIViewController()
		let vc11 = UIViewController()
		let vc12 = UIViewController()
		let vc13 = UITabBarController()
		let vc14 = UIViewController()
		let vc15 = UIViewController()

		vc1.add(child: vc2)
		vc3.viewControllers = [vc4]
		vc5.add(child: vc6)
		vc6.add(child: vc7)
		vc8.add(child: vc9)
		vc9.viewControllers = [vc10]
		vc13.viewControllers = [vc14]
		vc14.add(child: vc15)

		// branch:
		// empty1 -> vc2 -> tbc3 -> vc4 -> empty5 -> empty6 -> vc7 ->
		// empty8 -> tbc9 -> vc10 -> vc11 -> vc12 -> tbc13 -> empty14 -> vc15
		//
		// groups:
		// group(empty1, vc2) -> group(tbc3, vc4) -> group(empty5, empty6, vc7) ->
		// group(empty8, tbc9, vc10) -> single(vc11) -> single(vc12) -> group(tbc13, empty14, vc15)
		let branch = [vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9, vc10, vc11, vc12, vc13, vc14, vc15]
		let groups = grouper.group(branch)

		XCTAssertEqual(groups.count, 7)
		XCTAssertEqual(groups.map { $0.bottom }, [vc1, vc3, vc5, vc8, vc11, vc12, vc13])
		XCTAssertEqual(groups.map { $0.top }, [vc2, vc4, vc7, vc10, vc11, vc12, vc15])
	}
}
