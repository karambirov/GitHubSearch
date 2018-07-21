//
//  Task.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

enum Task {
    case requestWithParameters([String: String])
    case requestWithEncodable(Encodable)
}
