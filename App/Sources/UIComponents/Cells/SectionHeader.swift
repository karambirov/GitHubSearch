//
//  SectionHeader.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 31.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol TextConfiguringHeader: UIView {

	func configure(with text: String)
}

final class SectionHeader<View: TextConfiguringHeader>: UICollectionReusableView {

	typealias SupplementaryRegistration = UICollectionView.SupplementaryRegistration<SectionHeader<View>>

	private lazy var view: View = .init()

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

	static func registration(headerText: String) -> SupplementaryRegistration {
		SupplementaryRegistration(kind: .header) { header, string, indexPath in
			header.configure(with: headerText)
		}
	}
}

typealias TextSectionHeader = SectionHeader<TextSectionHeaderView>

final class TextSectionHeaderView: ProgrammaticView, TextConfiguringHeader {

	private let titleLabel = UILabel()

	override func configure() {
		titleLabel.font = .custom(style: .headline)
	}

	override func constrain() {
		addSubview(titleLabel)
		titleLabel.edgesToMargin()
	}

	func configure(with text: String) {
		titleLabel.text = text
	}
}
