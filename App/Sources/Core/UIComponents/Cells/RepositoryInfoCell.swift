//
//  RepositoryInfoCell.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

typealias RepositoryInfoCell = UICollectionViewListCell

extension RepositoryInfoCell {

	static func infoCellRegistration(text: String, secondaryText: String) -> ListCellRegistration {
		ListCellRegistration { cell, indexPath, infoItem in
			var content = UIListContentConfiguration.valueCell()
			content.text = text
			content.secondaryText = secondaryText
			cell.contentConfiguration = content
		}
	}
}
