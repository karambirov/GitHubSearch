//
//  Owner.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 12/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

struct User: Codable {
    let login: String
    let email: String?
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case login, email
        case avatarURL = "avatar_url"
    }
}
