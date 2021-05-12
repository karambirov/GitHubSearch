//
//  NavigationStateNotifier.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol NavigationStateNotifier: AnyObject {

	var listeners: WeakThreadSafeSet<NavigationStateListener> { get }
}

extension NavigationStateNotifier {

	func notifyStartedLoading() {
		listeners.forEach {
			$0.startLoading()
		}
	}

	func notifyFinishedLoading() {
		listeners.forEach {
			$0.finishedLoading()
		}
	}

	func notifyAbout(_ error: Error) {
		listeners.forEach {
			$0.received(error: error)
		}
	}
}
