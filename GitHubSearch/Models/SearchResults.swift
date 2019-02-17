//
//  SearchResults.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

struct SearchResults<R: Codable>: Codable {
    let items: [R]
}
