//
//  SearchResults.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 21/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

struct SearchResults<T: Codable>: Codable {
    let items: [T]
}
