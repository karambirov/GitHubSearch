//
//  Owner.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 23/01/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

struct Owner {

	let login: String
	let email: String?
	let avatarURL: String?
}

extension Owner {

	init() {
		self.init(login: String(), email: nil, avatarURL: nil)
	}
}

extension Owner: Codable {

	enum CodingKeys: String, CodingKey {
		case login, email
		case avatarURL = "avatar_url"
	}
}
