//
//  CollectionViewCell.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 19.03.2023.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "cell"

    lazy var test = UILabel()
    lazy var view = UIView()
    lazy var iconImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(test)
        contentView.addSubview(view)
        view.addSubview(iconImageView)

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1

        test.text = "test"
        test.textColor = UIColor(named: "blackWhite")
        test.font = UIFont(name: "DisketMono-Bold", size: 12)

        view.layer.cornerRadius = 8

        test.snp.makeConstraints { maker in
            maker.centerY.equalTo(contentView).offset(58)
            maker.centerX.equalTo(contentView)
        }

        view.snp.makeConstraints { maker in
            maker.top.left.equalTo(contentView).offset(5)
            maker.right.bottom.equalTo(contentView).inset(5)
        }

        iconImageView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalTo(view)
            maker.height.width.equalTo(view).inset(13)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
