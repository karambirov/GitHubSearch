//
//  RealmService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 08/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmService {

    private let realmConfig = Realm.Configuration(schemaVersion: 1)

    init() {
        Realm.Configuration.defaultConfiguration = realmConfig
    }

    private var realm: Realm {
        do {
            let realm = try Realm()
            return realm
        } catch {
            fatalError("Can't get realm")
        }
    }

    private func write(_ block: (Realm) -> Void) {
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

// MARK: - CRUD
extension RealmService {

    func save(_ object: Object) {
        write { $0.add(object) }
    }

    func update(_ block: @escaping () -> Void) {
        write { _ in
            block()
        }
    }

    func delete(_ object: Object) {
        write { $0.delete(object) }
    }

    func deleteAll(_ model: Object) {
        write { $0.deleteAll() }
    }

    func fetch<T: Object>(_ model: T.Type,
                          predicate: NSPredicate? = nil,
                          sorted: Sorted? = nil,
                          completion: ([T]) -> Void) {

        write { realm in
            let objects = realm.objects(model)

            if let predicate = predicate {
                _ = objects.filter(predicate)
            }

            if let sorted = sorted {
                _ = objects.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
            }

            completion(objects.compactMap { $0 })
        }

    }

}
