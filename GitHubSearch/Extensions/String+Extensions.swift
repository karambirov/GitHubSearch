//
//  String+Extensions.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 12/03/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import Foundation

extension String {
    
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
    
}
