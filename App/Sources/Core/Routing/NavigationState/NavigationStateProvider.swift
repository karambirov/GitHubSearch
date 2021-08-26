//
//  NavigationStateProvider.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import Foundation

protocol NavigationStateProviderProtocol: AnyObject {

	func register(stateListener: NavigationStateListener)
	func unregister(stateListener: NavigationStateListener)
}

final class NavigationStateProvider: NSObject, NavigationStateProviderProtocol, NavigationStateNotifier {

	let listeners = WeakThreadSafeSet<NavigationStateListener>()

	func register(stateListener: NavigationStateListener) {
		listeners.add(stateListener)
	}

	func unregister(stateListener: NavigationStateListener) {
		listeners.remove(stateListener)
	}
}
