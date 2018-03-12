//
//  Result.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 12/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}
