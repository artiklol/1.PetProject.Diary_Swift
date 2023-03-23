//
//  CategoriesViewController.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 19.03.2023.
//

import UIKit

class CategoriesViewController: UIViewController {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "elephant")
        return collectionView
    }()

//    let categories = ["Swift", "Алгоритмы", "Фреймворки", "Сеть",
//                      "Хранение данных", "Многопоточность", "Библиотеки",
//                      "Архитектура", "Тестирование", "Инструменты",
//                      "Безопасность", "Дизайн"]

    let categories = [
        Category(name: "Swift", icon: "swift", color: "postelOne"),
        Category(name: "Алгоритмы", icon: "algorithm", color: "postelTwo"),
        Category(name: "Фреймворки", icon: "framework", color: "postelThree"),
        Category(name: "Хранение данных", icon: "database", color: "postelFive"),
        Category(name: "Сеть", icon: "network", color: "postelFour"),
        Category(name: "Многопоточность", icon: "multithreading", color: "postelSix"),
        Category(name: "Библиотеки", icon: "libraries", color: "postelSeven"),
        Category(name: "Архитектура", icon: "architecture", color: "postelEight"),
        Category(name: "Тестирование", icon: "testing", color: "postelNine"),
        Category(name: "Инструменты", icon: "tools", color: "postelTen"),
        Category(name: "Безопасность", icon: "security", color: "postelEleven"),
        Category(name: "Дизайн", icon: "design", color: "postelTwelve")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.identifier)

        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()

        let search = UISearchController(searchResultsController: nil)
        //        let searchBar = UISearchBar()
        //        search.delegate = self
        //        search.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.title = "Категории"

        navigationItem.searchController = search

        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }

    func setupCollectionView() {
        collectionView.snp.makeConstraints { maker in
            maker.top.left.right.bottom.equalTo(view)
        }
    }
}

extension CategoriesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                            for: indexPath) as? CollectionViewCell else {
            return CollectionViewCell()
        }

        cell.layer.cornerRadius = 10
        cell.test.text = categories[indexPath.row].name
        cell.iconImageView.image = UIImage(named: categories[indexPath.row].icon)
        cell.view.backgroundColor = UIColor(named: categories[indexPath.row].color)
        cell.test.numberOfLines = 0
        return cell
    }
}

extension CategoriesViewController: UICollectionViewDelegate {

}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = view.bounds.width - 120
        let cellWidth = availableWidth / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        return sectionInset
    }
}
