//
//  CategoriesViewController.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 19.03.2023.
//

import UIKit
import SnapKit

class CategoriesViewController: UIViewController {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "elephant")
        return collectionView
    }()

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

    let test = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.identifier)

        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionView()

        let search = UISearchController(searchResultsController: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        search.searchBar.searchTextField.backgroundColor = UIColor(named: "lightGray")
        search.searchBar.placeholder = "Поиск"

        navigationItem.hidesSearchBarWhenScrolling = false
        search.hidesNavigationBarDuringPresentation = false

        let tesi = UIView()
        tesi.backgroundColor = .none
        tesi.layer.borderColor = UIColor.black.cgColor
        tesi.layer.borderWidth = 1
        tesi.layer.cornerRadius = 8
        tesi.backgroundColor = .white

        let resd = UIView()
        resd.layer.cornerRadius = 7
        resd.backgroundColor = UIColor(named: "lightGray")

        search.searchBar.insertSubview(tesi, at: 0)
        search.searchBar.insertSubview(resd, at: 1)

        tesi.snp.makeConstraints { maker in
            maker.centerX.centerY.equalTo(search.searchBar.searchTextField)
            maker.width.height.equalTo(search.searchBar.searchTextField).offset(10)
        }

        resd.snp.makeConstraints { maker in
            maker.top.left.right.bottom.equalTo(tesi).inset(5)
        }

        search.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        let cancelButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "DisketMono-Bold", size: 14)
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes(cancelButtonAttributes as [NSAttributedString.Key: Any], for: .normal)

        navigationItem.title = "Категории"

        navigationItem.searchController = search

        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "DisketMono-Bold", size: 30) as Any
        ]
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
