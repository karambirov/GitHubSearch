//
//  NetworkingResult.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

enum NetworkingResult<T> {
    case success(T)
    case error(NetworkingError)
}
