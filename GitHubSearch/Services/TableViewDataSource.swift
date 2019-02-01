//
//  TableViewDataSource.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

final class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {

    typealias CellConfigurator = (Model, Cell) -> Void

    var models: [Model]

    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator

    init(models: [Model], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeueCell(withIdentifier: reuseIdentifier, for: indexPath)

        cellConfigurator(model, cell)
        return cell
    }

}

extension TableViewDataSource where Model == Repository {
    static func make(for repositories: [Repository],
                     reuseIdentifier: String = RepositoryCell.typeName) -> TableViewDataSource {
        return TableViewDataSource(models: repositories, reuseIdentifier: reuseIdentifier,
                                   cellConfigurator: { repository, cell in
            let cellViewModel = RepositoryCellViewModel(repository: repository)
            if let cell = cell as? RepositoryCell {
                cell.setup(with: cellViewModel)
            }
            cell.layoutIfNeeded()
        })
    }
}
