//
//  Owner.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

struct Owner: Codable {
    let login: String
    let email: String?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case login, email
        case avatarURL = "avatar_url"
    }
}
