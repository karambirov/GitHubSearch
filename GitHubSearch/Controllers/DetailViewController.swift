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

    func configureView() {
        // Update the user interface for the detail item.
//        if let detail = detailItem {
//
//        }
    }

    // MARK: - View Controller's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

}

