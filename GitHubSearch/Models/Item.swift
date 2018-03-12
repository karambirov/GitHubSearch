//
//  Item.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 12/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

struct Item: Codable {
    let name, fullName: String
    let owner: Owner
    let description, language: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner, description, language
    }
}
