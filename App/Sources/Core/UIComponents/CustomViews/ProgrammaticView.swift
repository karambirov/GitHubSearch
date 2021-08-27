//
//  ProgrammaticView.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 27.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

class ProgrammaticView: UIView {

	@available(*, unavailable, message: "Don't use init(coder:), override init(frame:) instead")
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
		constrain()
	}

	func configure() {}
	func constrain() {}
}
