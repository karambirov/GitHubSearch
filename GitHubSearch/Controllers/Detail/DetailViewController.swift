//
//  DetailViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 07/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

private enum Constants {
    static let nibName = "DetailViewController"
    static let cellIdentifier = "DetailCell"
    static let navigationTitle = "About repository"
}

final class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    // MARK: - Properties
    var repository: Repository?
    
    // MARK: - ViewController's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

// MARK: - Setup
extension DetailViewController {
    
    fileprivate func initialSetup() {
        setupTableView()
        setupNavigationBar()
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        
        let nib = UINib(nibName: Constants.cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = Constants.navigationTitle
        // FIXME: - Add action to rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
    }
    
    static func instantiateFromNib() -> DetailViewController {
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        let vc = nib.instantiate(withOwner: nil, options: nil).first as! DetailViewController
        return vc
    }
    
}

// MARK: - Table View Setup
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? DetailCell {
            cell.repository = repository
            return cell
        }
        
        print("Error occured")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Error"
        
        return cell
    }
    
}
























