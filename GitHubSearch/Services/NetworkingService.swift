//
//  NetworkingService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

final class NetworkingService<Resource: ResourceType>: NetworkingType {

    init() {}

    func request(_ resource: Resource,
                 session: NetworkingSession = URLSession.shared,
                 completion: @escaping (NetworkingResult<Response>) -> Void) -> URLSessionDataTask {

        let request = URLRequest(resource: resource)

        return session.loadData(with: request) { data, response, error in
            guard error == nil else {
                completion(.error(.error(error)))
                return
            }

            guard let data = data else {
                completion(.error(.emptyResult))
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.error(.noHttpResponse))
                return
            }

            guard 200..<300 ~= response.statusCode else {
                completion(.error(.requestFailed(data)))
                return
            }

            completion(.success(Response(urlRequest: request, data: data)))
        }
    }

}
