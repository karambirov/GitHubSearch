//
//  NetworkingSession.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

protocol NetworkingSession {
    typealias completionHandler = (Data?, URLResponse?, Error?) -> Void

    func loadData(with urlRequest: URLRequest, completionHandler: @escaping completionHandler) -> URLSessionDataTask
}
