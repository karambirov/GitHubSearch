//
//  NetworkingError.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case error(Error?)
    case emptyResult
    case decodingFailed(Error?)
    case noHttpResponse
    case requestFailed(Data)
}
