//
//  UITableView+Extensions.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 19/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeueCell<Cell: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> Cell {
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
    }

}
