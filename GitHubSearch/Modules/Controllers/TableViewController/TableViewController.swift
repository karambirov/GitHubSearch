//
//  TableViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import KafkaRefresh

class TableViewController: ViewController, UIScrollViewDelegate {

    // MARK: - Properties
    let headerRefreshTrigger = PublishSubject<Void>()
    let footerRefreshTrigger = PublishSubject<Void>()

    let isHeaderLoading = BehaviorRelay(value: false)
    let isFooterLoading = BehaviorRelay(value: false)

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Views
    fileprivate lazy var tableView: TableView = {
        let view = TableView(frame: .zero, style: .plain)
        view.emptyDataSetSource = self
        view.emptyDataSetDelegate = self
        view.rx.setDelegate(self).disposed(by: rx.disposeBag)
        return view
    }()

}

// MARK: - Actions
extension TableViewController {

//    override func makeUI() {
//        super.makeUI()
//
//        stackView.spacing = 0
//        stackView.addArrangedSubview(tableView)
//
//        tableView.bindGlobalStyle(forHeadRefreshHandler: { [weak self] in
//            if self?.tableView.headRefreshControl.isTriggeredRefreshByUser == false {
//                self?.headerRefreshTrigger.onNext(())
//            }
//        })
//
//        tableView.bindGlobalStyle(forFootRefreshHandler: { [weak self] in
//            self?.footerRefreshTrigger.onNext(())
//        })
//
//        isHeaderLoading.bind(to: tableView.headRefreshControl.rx.isAnimating).disposed(by: rx.disposeBag)
//        isFooterLoading.bind(to: tableView.footRefreshControl.rx.isAnimating).disposed(by: rx.disposeBag)
//
//        tableView.footRefreshControl.autoRefreshOnFoot = true
//
//        let updateEmptyDataSet = Observable.of(isLoading.mapToVoid().asObservable(), emptyDataSetImageTintColor.mapToVoid(), languageChanged.asObservable()).merge()
//        updateEmptyDataSet.subscribe(onNext: { [weak self] () in
//            self?.tableView.reloadEmptyDataSet()
//        }).disposed(by: rx.disposeBag)
//    }
//
//    override func updateUI() {
//        super.updateUI()
//    }

}

// MARK: - UITableViewDelegate
extension TableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }

}
