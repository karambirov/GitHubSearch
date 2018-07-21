//
//  URLRequest+Extensions.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

extension URLRequest {

    init(resource: ResourceType) {
        var url = resource.baseURL.appendingPathComponent(resource.endpoint)

        if case let .requestWithParameters(parameters) = resource.task {
            url = url.appendingQueryParameters(parameters)
        }

        self.init(url: url)

        httpMethod = resource.method.rawValue

        for (key, value) in resource.headers {
            addValue(value, forHTTPHeaderField: key)
        }

        if resource.method == .post || resource.method == .put {
            if case let .requestWithEncodable(encodable) = resource.task {
                let anyEncodable = AnyEncodable(encodable)
                httpBody = encode(object: anyEncodable)
            }
        }
    }

    func encode<E>(object: E) -> Data? where E: Encodable {
        return try? JSONEncoder().encode(object)
    }

}
