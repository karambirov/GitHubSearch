//
//  RegistryError.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 11.05.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

enum RegistryError: Error {

	case cannotCast(fromType: Any.Type, toType: Any.Type)
	case tagNotRegistered(tag: CustomStringConvertible, parameters: Any.Type?)
}

extension RegistryError {

	var localizedDescription: String {
		switch self {
		case .cannotCast(let fromType, let toType):
			return "Сannot cast from \(fromType) to type \(toType)"
		case .tagNotRegistered(let tag, let parameters):
			return parameters != nil
				? "There is no registred builder without parameters for tag \(tag)"
				: "There is no registred builder with parameters \(String(describing: parameters)) for tag \(tag)"
		}
	}
}
