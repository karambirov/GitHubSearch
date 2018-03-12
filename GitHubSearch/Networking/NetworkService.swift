//
//  NetworkService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 12/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation
import Moya

private enum Constants {
    static let baseURL = "https://api.github.com"
    static let repoSearchPath = "/search/repositories"
}

public enum NetworkService {
    case repoSearch(query: String)
}

// MARK: - TargetType Protocol Implementation
extension NetworkService: TargetType {
    
    static let provider = MoyaProvider<NetworkService>()
    
    public var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
    
    public var path: String {
        switch self {
        case .repoSearch(_):
            return Constants.repoSearchPath
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
        guard let parameters = parameters else { return .requestPlain }
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}






























