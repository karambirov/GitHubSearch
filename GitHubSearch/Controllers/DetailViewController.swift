//
//  DetailViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 16/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Properties
    var repository: Repository? {
        didSet {
            configureView()
            print(repository ?? "There is no any repo")
        }
    }

    // MARK: - View Controller's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}


// MARK: - Internal
extension DetailViewController {
    
}


// MARK: - Private
private extension DetailViewController {

    func configureView() {
        guard let repository = repository else { return }

        title = repository.fullName

        // TODO: - Set outlets here
    }

}
