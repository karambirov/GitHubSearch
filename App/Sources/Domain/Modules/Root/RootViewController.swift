//
//  RootViewController.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 24.09.2020.
//  Copyright © 2020 Eugene Karambirov. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

	private let mainTabBarController: UITabBarController

	init(tabBarController: UITabBarController) {
		self.mainTabBarController = tabBarController
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
	  let view = UIView(frame: .zero)
	  installChild(mainTabBarController, in: view)
	  self.view = view
	}

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension RootViewController {

	func installChild(_ controller: UIViewController, in host: UIView) {
	  addChild(controller)
	  controller.view.frame = host.bounds
	  controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
	  host.addSubview(controller.view)
	  controller.didMove(toParent: self)
	}

}
