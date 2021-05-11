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

    dynamic var fullName = ""
    dynamic var repoDescription: String?
    dynamic var language: String?
    dynamic var owner: Owner?

    dynamic var isFavorite = false

    enum CodingKeys: String, CodingKey {
        case owner, language
        case fullName = "full_name"
        case repoDescription = "description"
    }

    public override static func indexedProperties() -> [String] {
        return ["isFavorite"]
    }

    override public class func primaryKey() -> String {
        return "fullName"
    }

}

// MARK: - Initialization
extension Repository {

    convenience init(fullName: String,
                     repoDescription: String,
                     language: String,
                     isFavorite: Bool,
                     owner: Owner) {

        self.init()
        self.fullName = fullName
        self.repoDescription = repoDescription
        self.language = language
        self.isFavorite = isFavorite
        self.owner = owner
    }
}

// MARK: - NSCopying
extension Repository: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let repository = Repository(fullName: self.fullName,
                                    repoDescription: self.repoDescription ?? "",
                                    language: self.language ?? "",
                                    isFavorite: self.isFavorite,
                                    owner: self.owner?.copy() as? Owner ??
                                        Owner(login: "", email: ""))
        return repository
    }
}
