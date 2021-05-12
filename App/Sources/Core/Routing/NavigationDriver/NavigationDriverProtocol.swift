//
//  NavigationDriverProtocol.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

typealias NavigationResult = Result<OperationStatus, NavigationError>
typealias NavigationCompletion = (NavigationResult) -> Void

protocol NavigationDriverProtocol: AnyObject {

	associatedtype NavigationSeed: NavigationSeedProtocol
	associatedtype NavigationTag: NavigationTagProtocol

	var currentTag: NavigationTag? { get }
	var currentIndex: NavigationIndex { get }

	func isReachable(_: NavigationTag) -> Bool
	func isPresented(_: NavigationTag) -> Bool
	func forward(to: NavigationSeed, animated: Bool, completion: @escaping NavigationCompletion)
	func replace(with: NavigationSeed, animated: Bool, completion: @escaping NavigationCompletion)
	func back(animated: Bool, completion: @escaping NavigationCompletion)
	func back(to: NavigationTag, animated: Bool, completion: @escaping NavigationCompletion)
	func back(to: NavigationIndex, animated: Bool, completion: @escaping NavigationCompletion)
	func back(from: NavigationTag, animated: Bool, completion: @escaping NavigationCompletion)
	func backToRoot(animated: Bool, completion: @escaping NavigationCompletion)
	func backToFlowRoot(animated: Bool, completion: @escaping NavigationCompletion)
}
