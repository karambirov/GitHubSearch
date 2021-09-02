//
//  TextSectionHeader.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

final class TextSectionHeader: UICollectionReusableView {

	private let view: TextSectionHeaderViewProtocol = TextSectionHeaderView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		constrain()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		fatalError("init(coder:) has not been implemented")
	}

	private func constrain() {
		addSubview(view)
		view.edgesToMargin()
	}

	func configure(with text: String) {
		view.configure(with: text)
	}
}

extension TextSectionHeader {

	typealias SupplementaryRegistration = UICollectionView.SupplementaryRegistration<TextSectionHeader>

	static func registration(headerText: String) -> SupplementaryRegistration {
		SupplementaryRegistration(kind: .header) { header, _, _ in
			header.configure(with: headerText)
		}
	}
}
