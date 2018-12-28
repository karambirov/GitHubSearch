//
//  StackView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 28/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit

class StackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }

    fileprivate func makeUI() {
        spacing = inset
        axis = .vertical
        updateUI()
    }

    fileprivate func updateUI() {
        setNeedsDisplay()
    }

}
