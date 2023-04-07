//
//  CategoriesCollectionViewCell.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 19.03.2023.
//

import UIKit
import SnapKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    static let identifier = "cell"

    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "blackWhite")
        label.font = UIFont(name: "DisketMono-Bold", size: 12)
        label.numberOfLines = 0
        return label
    }()

    private lazy var imageBackgroundColor: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()

    private lazy var iconImageView = UIImageView()

    var viewModel: CategoriesCellViewModelProtocol? {
        didSet {
            if let viewModel {
                categoryNameLabel.text = viewModel.name
                iconImageView.image = UIImage(named: viewModel.icon)
                imageBackgroundColor.backgroundColor = UIColor(named: viewModel.color)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setContentView()
        addUIElements()
        setConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addUIElements() {
        contentView.addSubview(categoryNameLabel)
        contentView.addSubview(imageBackgroundColor)
        imageBackgroundColor.addSubview(iconImageView)
    }

    private func setConstraint() {
        categoryNameLabel.snp.makeConstraints { maker in
            maker.centerY.equalTo(contentView).offset(58)
            maker.centerX.equalTo(contentView)
        }

        imageBackgroundColor.snp.makeConstraints { maker in
            maker.top.left.equalTo(contentView).offset(5)
            maker.right.bottom.equalTo(contentView).inset(5)
        }

        iconImageView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalTo(imageBackgroundColor)
            maker.height.width.equalTo(imageBackgroundColor).inset(13)
        }
    }

    private func setContentView() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
    }

}
