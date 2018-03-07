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

// TODO: - Figure out how to make inits more elegant

final class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    // MARK: - Properties
    fileprivate var ownerName: String
    fileprivate var ownerEmail: String
    fileprivate var repoFullName: String
    fileprivate var repoDescription: String
    
    // MARK: - ViewController's Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.ownerName = "ownerName"
        self.ownerEmail = "ownerEmail"
        self.repoFullName = "repoFullName"
        self.repoDescription = "repoDescription"
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
     convenience init(ownerName: String, ownerEmail: String, repoFullName: String, repoDescription: String) {
        self.init(nibName: Constants.nibName, bundle: nil)
        self.ownerName = ownerName
        self.ownerEmail = ownerEmail
        self.repoFullName = repoFullName
        self.repoDescription = repoDescription
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.ownerName = "ownerName"
        self.ownerEmail = "ownerEmail"
        self.repoFullName = "repoFullName"
        self.repoDescription = "repoDescription"
        
        super.init(coder: aDecoder)
    }
    
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
        
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = Constants.navigationTitle
        // FIXME: - Add action to rightBarButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
    }
    
}

// MARK: - Table View Setup
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? DetailCell {
            
        }
        
        print("Error occured")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Test"
        
        return cell
    }
    
}
























