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

class ViewController: UIViewController {

    let isLoading = BehaviorRelay(value: false)

    var emptyDataSetTitle = R.string.localizable.commonNoResults.key.localized()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        bindViewModel()
        setupNotifications()
    }

}

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
