//
//  WeakThreadSafeSet.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 12.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import Foundation

final class WeakThreadSafeSet<T> {

	private struct WeakWrapper {
		weak var value: AnyObject?
	}

	private var array = [WeakWrapper]()
	private let queue = DispatchQueue(label: "WeakThreadSafeSet", attributes: .concurrent)

	var isEmpty: Bool {
		self.count() == 0
	}

	func add(_ object: T) {
		let object = object as AnyObject
		queue.async(flags: .barrier) { [weak object] in
			if self.array.contains(where: { $0.value === object }) == false {
				self.array.append(WeakWrapper(value: object))
			}
		}
	}

	func remove(_ object: T) {
		let object = object as AnyObject
		queue.async(flags: .barrier) { [weak object] in
			self.array.removeAll {
				guard let value = $0.value else { return true }
				return value === object
			}
		}
	}

	func forEach(_ body: (T) -> Void) {
		queue.sync {
			return self.array.compactMap { $0.value as? T }.forEach(body)
		}
	}

	func contains(_ object: T) -> Bool {
		return queue.sync {
			return self.array.contains {
				return $0.value === object as AnyObject
			}
		}
	}

	func count() -> Int {
		return queue.sync {
			return self.array.compactMap { $0.value as? T }.count
		}
	}

	func flush() {
		self.queue.async(flags: .barrier) {
			self.array.removeAll { $0.value == nil }
		}
	}
}
