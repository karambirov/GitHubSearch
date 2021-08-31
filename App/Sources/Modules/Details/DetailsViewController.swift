//
//  DetailsViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol DetailsViewControllerProtocol: AnyObject {

	var dismissHandler: (() -> Void)? { get set }
}

final class DetailsViewController: UIViewController, DetailsViewControllerProtocol {

	var dismissHandler: (() -> Void)?

    private let presenter: DetailsPresenterProtocol
	private let contentView: DetailsViewProtocol

    init(presenter: DetailsPresenterProtocol) {
        self.presenter = presenter
		self.contentView = DetailsView()
        super.init(nibName: nil, bundle: nil)
    }

	@available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func loadView() {
		self.view = contentView
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		presenter.viewDidLoad(self.contentView, vc: self)
    }
}
