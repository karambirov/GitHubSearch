//
//  Response.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

final class Response {
    let urlRequest: URLRequest
    let data: Data

    init(urlRequest: URLRequest, data: Data) {
        self.urlRequest = urlRequest
        self.data       = data
    }

    func map<D>(to type: D.Type) throws -> D where D: Decodable {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch let error {
            throw NetworkingError.decodingFailed(error)
        }
    }
}
