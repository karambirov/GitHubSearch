//
//  Result+OperationStatus.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

enum OperationStatus {

	case operated
	case noOperation
}

extension Result where Success == OperationStatus {

	static var successNoOperation: Result {
		return .success(.noOperation)
	}

	static var success: Result {
		return .success(.operated)
	}
}

extension Result where Success == Void {

	static var success: Result {
		return .success(())
	}
}
