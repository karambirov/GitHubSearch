//
//  Debouncer.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 17.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import Foundation

public protocol DebouncerProtocol: AnyObject {

	func debounce(_ action: @escaping () -> Void)
	func cancel()
}

public final class Debouncer {

	private var workItem = DispatchWorkItem(block: {})
	private let queue: DispatchQueue
	private let delay: TimeInterval

	public init(delay: TimeInterval = 0.3, queue: DispatchQueue = .main) {
		self.delay = delay
		self.queue = queue
	}
}

extension Debouncer: DebouncerProtocol {

	public func debounce(_ action: @escaping () -> Void) {
		workItem.cancel()

		workItem = DispatchWorkItem {
			action()
		}

		queue.asyncAfter(deadline: .now() + delay, execute: self.workItem)
	}

	public func cancel() {
		workItem.cancel()
	}
}
