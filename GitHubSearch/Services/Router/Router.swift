//
//  Router.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit

protocol Closable: AnyObject {
    func close()
}

protocol RouterProtocol: AnyObject {
    associatedtype ViewController: UIViewController

    /// Should be declared as weak.
    var viewController: ViewController? { get }

    func open(_ viewController: UIViewController, transition: Transition)
}

class Router<U>: RouterProtocol, Closable where U: UIViewController {

    typealias ViewController = U

    weak var viewController: ViewController?
    var openTransition: Transition?

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }

    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }

        guard let viewController = viewController else {
            assertionFailure("Nothing to close.")
            return
        }

        openTransition.close(viewController)
    }

}
