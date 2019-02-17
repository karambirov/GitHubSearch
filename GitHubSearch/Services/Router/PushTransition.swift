//
//  PushTransition.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

class PushTransition: NSObject {

    var animator: Animator?
    var isAnimated = true
    var completionHandler: (() -> Void)?

    weak var viewController: UIViewController?

    init(animator: Animator? = nil, isAnimated: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
    }

}

// MARK: - Transition
extension PushTransition: Transition {

    func open(_ viewController: UIViewController) {
        self.viewController?.navigationController?.delegate = self
        self.viewController?.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.viewController?.navigationController?.pushViewController(viewController, animated: isAnimated)
    }

    func close(_ viewController: UIViewController) {
        self.viewController?.navigationController?.popViewController(animated: isAnimated)
    }

}

// MARK: - UINavigationControllerDelegate
extension PushTransition: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        completionHandler?()
    }

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else { return nil }

        if operation == .push {
            animator.isPresenting = true
            return animator
        } else {
            animator.isPresenting = false
            return animator
        }
    }
}

// MARK: - UIGestureRecognizerDelegate
extension PushTransition: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
