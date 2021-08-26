//
//  Repository.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 19/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

struct Repository {

	let fullName: String
	let repoDescription: String?
	let language: String?
	let owner: Owner

	var isFavorite = false
}

extension Repository {

	init() {
		self.init(
			fullName: String(),
			repoDescription: nil,
			language: nil,
			owner: Owner(),
			isFavorite: false
		)
	}
}

extension Repository: Codable {

	enum CodingKeys: String, CodingKey {
		case owner, language
		case fullName = "full_name"
		case repoDescription = "description"
	}
}
