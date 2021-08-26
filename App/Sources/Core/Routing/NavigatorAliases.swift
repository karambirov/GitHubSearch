//
//  NavigatorAliases.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

typealias NavigationDriver = NavigationTreeDriver<Route>
typealias NavigationRegistry = NavigationItemsRegistry<NavigationSeed, Route>
typealias Navigator = NavigationAssistant<NavigationDriver, NavigationRegistry>
