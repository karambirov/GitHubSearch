//
//  NetworkService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import Moya

final class NetworkService {

    private var provider: MoyaProvider<GitHub>?

    init(provider: MoyaProvider<GitHub> = MoyaProvider<GitHub>()) {
        self.provider = provider
    }

    func searchRepositories(withQuery query: String) {
        provider?.request(.searchRepo(query: query), completion: { result in
            switch result {
            case .success(let response):
                do {
                    try print(response.map(Repository.self))
                } catch let error {
                    print(error.localizedDescription)
                }

            case .failure(let error):
                print(error)
            }
        })
    }

}
