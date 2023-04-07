//
//  CategoriesCollectionViewCellViewModel.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 07.04.2023.
//

import Foundation

protocol CategoriesCellViewModelProtocol {
    var name: String { get }
    var icon: String { get }
    var color: String { get }
    init(category: Category)
}

class CategoriesCellViewModel: CategoriesCellViewModelProtocol {

    var name: String {
        category.name
    }

    var icon: String {
        category.icon
    }

    var color: String {
        category.color
    }

    private let category: Category

    required init(category: Category) {
        self.category = category
    }

}
