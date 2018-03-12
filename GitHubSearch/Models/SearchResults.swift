//
//  SearchResult.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 12/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

struct SearchResults<T: Codable>: Codable {
    let items: [T]
}
