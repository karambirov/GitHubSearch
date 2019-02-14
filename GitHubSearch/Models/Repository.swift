//
//  Repository.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 19/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
final class Repository: Object, Codable {

    dynamic var fullName        = ""
    dynamic var repoDescription = ""
    dynamic var language        = ""
    dynamic var isFavorite      = false
    dynamic var owner: Owner?

    enum CodingKeys: String, CodingKey {
        case owner, language, isFavorite
        case fullName = "full_name"
        case repoDescription = "description"
    }

    public override static func indexedProperties() -> [String] {
        return ["isFavorite"]
    }

}

// MARK: - Initialization
extension Repository {
    convenience init(fullName: String, repoDescription: String, language: String, isFavorite: Bool, owner: Owner) {
        self.init()
        self.fullName = fullName
        self.repoDescription = repoDescription
        self.language = language
        self.isFavorite = isFavorite
        self.owner = owner
    }
}
