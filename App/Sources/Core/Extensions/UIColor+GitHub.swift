//
//  UIColor+GitHub.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 30.08.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

extension UIColor {

	convenience init(language: String?) {
		switch language {
		case "ASP.NET": self.init(rgbValue: 0x9400ff)
		case "Assembly":  self.init(rgbValue: 0x6E4C13)
		case "C": self.init(rgbValue: 0x555555)
		case "C#": self.init(rgbValue: 0x178600)
		case "C++": self.init(rgbValue: 0xf34b7d)
		case "Clojure": self.init(rgbValue: 0xdb5855)
		case "CSS": self.init(rgbValue: 0x563d7c)
		case "CSV": self.init(rgbValue: 0x237346)
		case "Dart": self.init(rgbValue: 0x00B4AB)
		case "Dockerfile": self.init(rgbValue: 0x384d54)
		case "Elixir": self.init(rgbValue: 0x6e4a7e)
		case "Erlang": self.init(rgbValue: 0xB83998)
		case "F#": self.init(rgbValue: 0xb845fc)
		case "Go": self.init(rgbValue: 0x00ADD8)
		case "Gradle": self.init(rgbValue: 0x02303a)
		case "GraphQL": self.init(rgbValue: 0xe10098)
		case "Groovy": self.init(rgbValue: 0x4298b8)
		case "Haskell": self.init(rgbValue: 0x5e5086)
		case  "HTML": self.init(rgbValue: 0xe34c26)
		case "Java": self.init(rgbValue: 0xb07219)
		case "JavaScript": self.init(rgbValue: 0xf1e05a)
		case "JSON": self.init(rgbValue: 0x292929)
		case "Kotlin": self.init(rgbValue: 0xA97BFF)
		case "Less": self.init(rgbValue: 0x1d365d)
		case "LLVM": self.init(rgbValue: 0x185619)
		case "Lua": self.init(rgbValue: 0x000080)
		case "Makefile": self.init(rgbValue: 0x427819)
		case "Markdown": self.init(rgbValue: 0x083fa1)
		case "Objective-C": self.init(rgbValue: 0x438eff)
		case "Objective-C++": self.init(rgbValue: 0x6866fb)
		case "Pascal": self.init(rgbValue: 0xE3F171)
		case "Perl": self.init(rgbValue: 0x0298c3)
		case "PHP": self.init(rgbValue: 0x4F5D95)
		case "PostCSS": self.init(rgbValue: 0xdc3a0c)
		case "PowerShell": self.init(rgbValue: 0x012456)
		case "Python": self.init(rgbValue: 0x3572A5)
		case "R": self.init(rgbValue: 0x198CE7)
		case "Regular Expression": self.init(rgbValue: 0x009a00)
		case "Ruby": self.init(rgbValue: 0x701516)
		case "Rust": self.init(rgbValue: 0xdea584)
		case "Sass": self.init(rgbValue: 0xa53b70)
		case "Scala": self.init(rgbValue: 0xc22d40)
		case "Scheme": self.init(rgbValue: 0x1e4aec)
		case "SCSS": self.init(rgbValue: 0xc6538c)
		case "Shell": self.init(rgbValue: 0x89e051)
		case "Smalltalk": self.init(rgbValue: 0x596706)
		case "SQL": self.init(rgbValue: 0xe38c00)
		case "Stylus": self.init(rgbValue: 0xff6347)
		case "Svelte": self.init(rgbValue: 0xff3e00)
		case "SVG": self.init(rgbValue: 0xff9900)
		case "Swift": self.init(rgbValue: 0xF05138)
		case "TOML": self.init(rgbValue: 0x9c4221)
		case "TypeScript": self.init(rgbValue: 0x2b7489)
		case "VBA": self.init(rgbValue: 0x867db1)
		case "Vim script": self.init(rgbValue: 0x199f4b)
		case "Vim Snippet": self.init(rgbValue: 0x199f4b)
		case "Vue": self.init(rgbValue: 0x41b883)
		case "WebAssembly": self.init(rgbValue: 0x04133b)
		case "XML": self.init(rgbValue: 0x0060ac)
		case "XML Property List": self.init(rgbValue: 0x0060ac)
		case "YAML": self.init(rgbValue: 0xcb171e)
		case "Zephir": self.init(rgbValue: 0x118f9e)
		default: self.init(rgbValue: 0x000000)
		}
	}
}
