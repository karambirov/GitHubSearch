//
//  Int+shorted.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 30.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import Foundation

extension Int {

	func shorted() -> String {
		switch self {
		case 1000..<10_000:
			return String(format: "%.1fK", Double(self/100)/10).replacingOccurrences(of: ".0", with: "")
		case 10_000..<1_000_000:
			return "\(self/1000)k"
		default:
			return String(self)
		}
	}
}
