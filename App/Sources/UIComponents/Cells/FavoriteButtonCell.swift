//
//  FavoriteButtonCell.swift
//  GitHubSearch
//
//  Created by Карамбиров Евгений on 02.09.2021.
//  Copyright © 2021 Eugene Karambirov. All rights reserved.
//

import UIKit

enum FavoriteButtonType {
	case favorite
	case unfavorite
}

final class FavoriteButtonCell: UICollectionViewCell {

	private enum Metrics {
		static let contentInsets = UIEdgeInsets(top: .offset16, left: .offset20, bottom: .offset16, right: .offset16)
		static let buttonImageSize: CGFloat = 14
	}

	private let button = UIButton()

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		constrain()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(with type: FavoriteButtonType) {
		switch type {
		case .favorite:
			setButtonImage(.star)
			setButtonTitleColor(.systemBlue)
			button.setTitle(.favorite, for: .normal)
		case .unfavorite:
			setButtonImage(.star)
			setButtonTitleColor(.systemRed)
			button.setTitle(.unfavorite, for: .normal)
			button.tintColor = .systemRed
		}
	}
}

extension FavoriteButtonCell {

	typealias CellRegistration = UICollectionView.CellRegistration<FavoriteButtonCell, FavoriteButtonType>

	static func registration() -> CellRegistration {
		CellRegistration { cell, _, favoriteButtonType in
			cell.configure(with: favoriteButtonType)
		}
	}
}

extension FavoriteButtonCell {

	private func constrain() {
		contentView.addSubview(button)
		button.edges(to: contentView, insets: Metrics.contentInsets)
	}

	private func setButtonImage(_ sfSymbol: UIImage.SFSymbol) {
		button.setImage(.sfSymbol(sfSymbol, with: .init(pointSize: Metrics.buttonImageSize)), for: .normal)
		// Adds spacing between image and title
		button.titleEdgeInsets = .left(.offset8)
		button.titleEdgeInsets = .right(-.offset8)
	}

	private func setButtonTitleColor(_ color: UIColor) {
		button.setTitleColor(color, for: .normal)
		button.setTitleColor(color.shade(.darker), for: .highlighted)
	}
}
