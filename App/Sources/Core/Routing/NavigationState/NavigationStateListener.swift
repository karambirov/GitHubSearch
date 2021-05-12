//
//  NavigationStateListener.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

protocol NavigationStateListener: AnyObject {

	func startLoading()
	func finishedLoading()
	func received(error: Error)
}
