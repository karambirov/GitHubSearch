//
//  ViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import RxSwift
import RxCocoa
import NSObject_Rx
import Localize_Swift
import SnapKit

class ViewController: UIViewController {

    // MARK: - Properties
    let isLoading = BehaviorRelay(value: false)
    var automaticallyAdjustsLeftBarButton = true

    fileprivate var emptyDataSetTitle = R.string.localizable.commonNoResults.key.localized()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        bindViewModel()
        setupNotifications()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if automaticallyAdjustsLeftBarButton {
            adjustLeftBarButtonItem()
        }
        updateUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }

    // MARK: - Views
    lazy var contentView: View = {
        let view = View()
        self.view.addSubview(view)
        view.snp.makeConstraints { make in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            } else {
                make.left.right.equalToSuperview()
                make.top.equalTo(self.topLayoutGuide.snp.bottom)
                make.bottom.equalTo(self.topLayoutGuide.snp.top)
            }
        }
        return view
    }()

    lazy var stackView: StackView = {
        let subviews: [UIView] = []
        let view = StackView(arrangedSubviews: subviews)
        self.contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return view
    }()

    fileprivate lazy var closeBarButton: UIBarButtonItem = {
        return UIBarButtonItem(title: R.string.localizable.commonClose.key.localized(),
                                   style: .done,
                                   target: self,
                                   action: #selector(close))
    }()

}

// MARK: - Actions
extension ViewController {

    var inset: CGFloat {
        return Configs.BaseDimensions.inset
    }

    func makeUI() {}
    func bindViewModel() {}
    func updateUI() {}

    func didBecomeActive() {
        updateUI()
    }

    fileprivate func setupNotifications() {
        // Observe application did become active notification
        NotificationCenter.default.rx
            .notification(UIApplication.didBecomeActiveNotification)
            .subscribe { [weak self] event in
                self?.didBecomeActive()
            }.disposed(by: rx.disposeBag)
    }

    fileprivate func adjustLeftBarButtonItem() {
        if self.navigationController?.viewControllers.count ?? 0 > 1 { // Pushed
            self.navigationItem.leftBarButtonItem = nil
        } else if self.presentingViewController != nil { // presented
            self.navigationItem.leftBarButtonItem = closeBarButton
        }
    }

    @objc fileprivate func close() {
        dismiss(animated: true)
    }

}

// MARK: - DZNEmptyDataSetSource
extension ViewController: DZNEmptyDataSetSource {

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: emptyDataSetTitle)
    }

    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return .clear
    }

    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -60
    }

}

// MARK: - DZNEmptyDataSetDelegate
extension ViewController: DZNEmptyDataSetDelegate {

    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return !isLoading.value
    }

    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
}
