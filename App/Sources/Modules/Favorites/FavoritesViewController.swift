//
//  FavoritesViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 31/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol FavoritesViewControllerProtocol: AnyObject { }

final class FavoritesViewController: UIViewController, FavoritesViewControllerProtocol {

	private let presenter: FavoritesPresenterProtocol
	private let contentView = FavoritesView()

    init(presenter: FavoritesPresenterProtocol) {
        self.presenter = presenter
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
		title = "Favorites"
		presenter.viewDidLoad(self.contentView)
    }
}
