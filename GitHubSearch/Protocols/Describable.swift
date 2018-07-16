//
//  Describable.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 16/07/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

protocol Describable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension Describable {
    var typeName: String {
        return String(describing: self)
    }

    static var typeName: String {
        return String(describing: self)
    }
}

extension Describable where Self: NSObjectProtocol {
    var typeName: String {
        return String(describing: type(of: self))
    }
}

