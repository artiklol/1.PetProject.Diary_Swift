//
//  CategoriesViewModel.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 07.04.2023.
//

import Foundation

protocol CategoriesViewModelProtocol: AnyObject {
    var categories: [Category] { get }
    func numberOfItems() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CategoriesCellViewModelProtocol
}

class CategoriesViewModel: CategoriesViewModelProtocol {

    var categories = [
        Category(name: "Swift", icon: "swift", color: "postelOne"),
        Category(name: "Алгоритмы", icon: "algorithm", color: "postelTwo"),
        Category(name: "Фреймворки", icon: "framework", color: "postelThree"),
        Category(name: "Хранение данных", icon: "database", color: "lightGray"),
        Category(name: "Сеть", icon: "network", color: "postelFour"),
        Category(name: "Многопоточность", icon: "multithreading", color: "postelSix"),
        Category(name: "Библиотеки", icon: "libraries", color: "postelSeven"),
        Category(name: "Архитектура", icon: "architecture", color: "postelEight"),
        Category(name: "Тестирование", icon: "testing", color: "postelNine"),
        Category(name: "Инструменты", icon: "tools", color: "postelTen"),
        Category(name: "Безопасность", icon: "security", color: "postelEleven"),
        Category(name: "Дизайн", icon: "design", color: "postelTwelve")
    ]

    func numberOfItems() -> Int {
        categories.count
    }

    func cellViewModel(at indexPath: IndexPath) -> CategoriesCellViewModelProtocol {
        let category = categories[indexPath.row]
        return CategoriesCellViewModel(category: category)
    }

}
