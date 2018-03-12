//
//  NetworkService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 12/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation
import Moya

public enum NetworkService {
    case repoSearch(query: String)
}

// MARK: - TargetType Protocol Implementation
extension NetworkService: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    public var path: String {
        switch self {
        case .repoSearch(_):
            return "/search/repositories"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .repoSearch(let query):
            return ["q": query.URLEscapedString]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var sampleData: Data {
        switch self {
        case .repoSearch(_):
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}






























