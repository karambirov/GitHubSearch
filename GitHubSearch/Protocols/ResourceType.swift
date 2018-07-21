//
//  ResourceType.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

protocol ResourceType {
    var baseURL: URL { get }
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String] { get }
}
