//
//  NavigationTagHolderVCMock.swift
//  GitHubSearchUnitTests
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import class UIKit.UIViewController
@testable import GitHubSearch

final class NavigationTagHolderVCMock: UIViewController, NavigationTagHolder {

	var navigationTag: String?
}
