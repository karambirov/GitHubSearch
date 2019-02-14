//
//  Owner.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
final class Owner: Object, Codable {

    dynamic var login = ""
    dynamic var email = ""
    dynamic var avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case login, email
        case avatarURL = "avatar_url"
    }

}

// MARK: - Initialization
extension Owner {
    convenience init(login: String, email: String, avatarURL: String? = nil) {
        self.init()
        self.login     = login
        self.email     = email
        self.avatarURL = avatarURL
    }
}
