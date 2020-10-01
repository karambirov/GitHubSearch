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

	private var config: Realm.Configuration {
		didSet {
			Realm.Configuration.defaultConfiguration = config
		}
	}

	init(config: Realm.Configuration = .init(schemaVersion: 1)) {
		self.config = config
    }

    private var realm: Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Can't get realm")
        }
    }

    private func write(_ closure: (Realm) -> Void) {
        do {
			try self.realm.write {
                closure(realm)
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

    func update(_ closure: @escaping () -> Void) {
		write { _ in closure() }
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

    func fetch<T: Object, KeyType>(ofType type: T.Type,
                                   forPrimaryKey key: KeyType) -> T? {
        return realm.object(ofType: type, forPrimaryKey: key)
    }

}
