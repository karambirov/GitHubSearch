//
//  NavigationItemsRegistryTests.swift
//  GitHubSearchUnitTests
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import XCTest
@testable import GitHubSearch

final class NavigationItemsRegistryTestCase: XCTestCase {

	private let registry = NavigationItemsRegistry<NavigationSeedMock, RouteMock>()

	func testNavigationItemBuilding() {
		let vc = NavigationTagHolderVCMock()
		let parameter = "hello"

		registry.register(.page1) { (parameter: String) in
			let seed = NavigationSeedMock(navigationTagHolder: vc, viewController: vc)
			return .item(seed: seed, module: ModuleMock(parameter: parameter))
		}

		let result = registry.makeItem(for: .page1, with: parameter, module: ModuleMock.self)

		switch result {
		case .success(let item):
			XCTAssertEqual(item.seed.viewController, vc)
			XCTAssertEqual(item.seed.navigationTagHolder.navigationTag, RouteMock.page1.rawValue)
			XCTAssertEqual(item.module.parameter, parameter)
		case .failure(let error):
			XCTFail(error.localizedDescription)
		case .none:
			XCTFail("result не должен быть равен nil")
		}
	}

	func testNavigationItemBuildingWithUnknownModule() {
		let vc = NavigationTagHolderVCMock()
		let parameter = "hello"

		registry.register(.page1) { (parameter: String) in
			let seed = NavigationSeedMock(navigationTagHolder: vc, viewController: vc)
			return .item(seed: seed, module: ModuleMock(parameter: parameter))
		}

		let result = registry.makeItem(for: .page1, with: parameter, module: Any.self)

		switch result {
		case .success(let item):
			XCTAssertEqual(item.seed.viewController, vc)
			XCTAssertEqual(item.seed.navigationTagHolder.navigationTag, RouteMock.page1.rawValue)
		case .failure(let error):
			XCTFail(error.localizedDescription)
		case .none:
			XCTFail("result не должен быть равен nil")
		}
	}

	func testNavigationItemBuildingWithDifferentParameters() {
		let vc = NavigationTagHolderVCMock()
		let parameter = ["hello"]

		registry.register(.page1) { (parameter: String) in
			let seed = NavigationSeedMock(navigationTagHolder: vc, viewController: vc)
			return .item(seed: seed, module: ModuleMock(parameter: parameter))
		}

		registry.register(.page1) { (parameter: [String]) in
			let seed = NavigationSeedMock(navigationTagHolder: vc, viewController: vc)
			return .item(seed: seed, module: ModuleMock(parameter: parameter[0]))
		}

		let result = registry.makeItem(for: .page1, with: parameter, module: ModuleMock.self)

		switch result {
		case .success(let item):
			XCTAssertEqual(item.seed.viewController, vc)
			XCTAssertEqual(item.seed.navigationTagHolder.navigationTag, RouteMock.page1.rawValue)
			XCTAssertEqual(item.module.parameter, parameter.first)
		case .failure(let error):
			XCTFail(error.localizedDescription)
		case .none:
			XCTFail("result не должен быть равен nil")
		}
	}

	func testNavigationItemBuildingWithoutParameters() {
		let vc = NavigationTagHolderVCMock()

		registry.register(.page1) {
			let seed = NavigationSeedMock(navigationTagHolder: vc, viewController: vc)
			return .item(seed: seed, module: ModuleMock(parameter: "fake"))
		}

		let result = registry.makeItem(for: .page1, module: Any.self)

		switch result {
		case .success(let item):
			XCTAssertEqual(item.seed.viewController, vc)
			XCTAssertEqual(item.seed.navigationTagHolder.navigationTag, RouteMock.page1.rawValue)
		case .failure(let error):
			XCTFail(error.localizedDescription)
		case .none:
			XCTFail("result не должен быть равен nil")
		}
	}

	func testNilNavigationItem() {
		registry.register(.page1) { () -> NavigationItem<NavigationSeedMock>? in
			return nil
		}

		let result = registry.makeItem(for: .page1, module: Any.self)
		XCTAssertNil(result)
	}
}
