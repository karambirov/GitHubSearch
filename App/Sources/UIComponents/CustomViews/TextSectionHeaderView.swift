//
//  TextSectionHeaderView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 02.09.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol TextSectionHeaderViewProtocol: UIView {

	func configure(with text: String)
}

final class TextSectionHeaderView: ProgrammaticView {

	private let titleLabel = UILabel()

	override func configure() {
		titleLabel.font = .custom(style: .headline)
	}

	override func constrain() {
		addSubview(titleLabel)
		titleLabel.edgesToMargin()
	}

}

extension TextSectionHeaderView: TextSectionHeaderViewProtocol {

	func configure(with text: String) {
		titleLabel.text = text
	}
}
