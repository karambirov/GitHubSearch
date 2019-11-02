//
//  Observable.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 25/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import Foundation

final class Observable<T> {

    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.observer?(self.value)
            }
        }
    }

    var observer: ((T?) -> Void)?

    func bind(observer: @escaping ((T?) -> Void)) {
        self.observer = observer
    }

}
