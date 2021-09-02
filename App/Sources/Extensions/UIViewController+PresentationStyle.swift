//
//  UIViewController+PresentationStyle.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIViewController {

	var presentationStyle: ViewControllerPresentationStyle? {
		let isPushed = self.navigationController?.viewControllers.contains { $0 == self } == true
			&& self.navigationController?.viewControllers.first != self

		if isPushed {
			return .push
		} else if self.presentingViewController != nil {
			return .modal(self.modalPresentationStyle)
		}

		return nil
	}
}
