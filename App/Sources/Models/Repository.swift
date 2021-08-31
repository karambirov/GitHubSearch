//
//  Repository.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 19/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

struct Repository: Hashable {

	let id: Int
	let fullName: String
	let repoDescription: String?
	let starsCount: Int
	let openIssuesCount: Int
	let language: String?
	let owner: Owner
	let license: License?

	var isFavorite = false
}

extension Repository: Codable {

	enum CodingKeys: String, CodingKey {
		case id, language, owner, license
		case fullName = "full_name"
		case repoDescription = "description"
		case starsCount = "stargazers_count"
		case openIssuesCount = "open_issues_count"
	}
}
