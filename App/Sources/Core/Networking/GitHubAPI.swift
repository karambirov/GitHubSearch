//
//  GitHub.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import Moya

enum GitHubAPI {
	case searchRepo(query: String, itemsCount: Int = 100)
}

extension GitHubAPI: TargetType {

    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("Error in base url: https://api.github.com")
        }
        return url
    }

    var path: String {
        switch self {
        case .searchRepo:
            return "/search/repositories"
        }
    }

    var method: Moya.Method {
		switch self {
		case .searchRepo:
			return .get
		}
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .searchRepo(let query, let itemsCount):
            return .requestParameters(
				parameters: ["q": query.urlEscapedString, "per_page": itemsCount],
				encoding: URLEncoding.default
			)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

}
