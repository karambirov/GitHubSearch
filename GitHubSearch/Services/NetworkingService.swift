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

    func request(resource: Resource, session: NetworkingSession,
                 completion: @escaping (NetworkingResult<Response>) -> Void) -> URLSessionDataTask {

        let request = URLRequest(resource: resource)
    }

}
