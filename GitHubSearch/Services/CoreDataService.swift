//
//  CoreDataService.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 17/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataService {

    // MARK: - Properties
    private let modelName: String

    lazy var mainContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()

    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
        }
        return container
    }()


    // MARK: - Initializers
    init(modelName: String) {
        self.modelName = modelName
    }
}


// MARK: - Internal
extension CoreDataService {

    func saveContext() {
        guard mainContext.hasChanges else { return }

        do {
            try mainContext.save()
        } catch let nserror as NSError {
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

}
