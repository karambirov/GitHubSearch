//
//  BaseRealmStorage.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 08/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import RealmSwift

class BaseRealmStorage {

    private let realmConfig = Realm.Configuration(schemaVersion: 1)

    init() {
        Realm.Configuration.defaultConfiguration = realmConfig
    }

    var realm: Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Can't get realm")
        }
    }

    func write(block: (Realm) -> Void) {
        let realm = self.realm
        do {
            try realm.write {
                block(realm)
            }
        } catch {
            assertionFailure("Can't write to realm")
        }
    }

}
