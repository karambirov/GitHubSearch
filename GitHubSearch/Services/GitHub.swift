//
//  GitHub.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

enum GitHub {

    /// Search repositories using Git Hub API.
    /// - `query` - String that would be searched in repositories names.
    case repoSearch(query: String)
}


// MARK: - ResourceType
extension GitHub: ResourceType {

    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("Error in base url: https://api.github.com")
        }
        return url
    }

    var endpoint: String {
        switch self {
        case .repoSearch:
            return "/search/repositories/"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .repoSearch:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .repoSearch(query):
            return .requestWithParameters(["q": query.URLEscapedString])
        }
    }

    var headers: [String : String] {
        return ["Content-type": "application/json"]
    }

}
