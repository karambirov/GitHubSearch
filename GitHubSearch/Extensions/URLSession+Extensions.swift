//
//  URLSession+Extensions.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

extension URLSession: NetworkingSession {

    func loadData(with urlRequest: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        let task = dataTask(with: urlRequest, completionHandler: completionHandler)
        task.resume()
        return task
    }

}
