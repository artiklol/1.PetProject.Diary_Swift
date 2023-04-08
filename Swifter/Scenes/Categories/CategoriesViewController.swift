//
//  CategoriesViewController.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 19.03.2023.
//

import UIKit

class CategoriesViewController: UIViewController {

    private lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(named: "elephant")
        return collectionView
    }()

    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.searchTextField.backgroundColor = .none
        search.searchBar.placeholder = "Поиск"
        search.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        let cancelButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "DisketMono-Bold", size: 14)
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
            .setTitleTextAttributes(cancelButtonAttributes as [NSAttributedString.Key: Any], for: .normal)

        let backgroundSearchBar = UIView()
        backgroundSearchBar.backgroundColor = .none
        backgroundSearchBar.layer.borderColor = UIColor.black.cgColor
        backgroundSearchBar.layer.borderWidth = 1
        backgroundSearchBar.layer.cornerRadius = 8
        backgroundSearchBar.backgroundColor = .white

        let backgroundSearchTextField = UIView()
        backgroundSearchTextField.layer.cornerRadius = 7
        backgroundSearchTextField.backgroundColor = UIColor(named: "postelFive")

        search.searchBar.insertSubview(backgroundSearchBar, at: 0)
        search.searchBar.insertSubview(backgroundSearchTextField, at: 1)

        backgroundSearchBar.snp.makeConstraints { maker in
            maker.centerX.centerY.equalTo(search.searchBar.searchTextField)
            maker.width.height.equalTo(search.searchBar.searchTextField).offset(10)
        }

        backgroundSearchTextField.snp.makeConstraints { maker in
            maker.top.left.right.bottom.equalTo(backgroundSearchBar).inset(5)
        }

        return search
    }()

    private lazy var viewModel: CategoriesViewModelProtocol = CategoriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.register(CategoriesCollectionViewCell.self,
                                          forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)

        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self

        addUIElements()
        setNavigationBar()
        setConstraint()
    }

    private func addUIElements() {
        view.addSubview(categoriesCollectionView)
    }

    private func setNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false

        navigationItem.title = "Категории"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "DisketMono-Bold", size: 30) as Any
        ]
    }

    private func setConstraint() {
        categoriesCollectionView.snp.makeConstraints { maker in
            maker.top.left.right.bottom.equalTo(view)
        }
    }
}

extension CategoriesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoriesCollectionViewCell.identifier,
            for: indexPath) as? CategoriesCollectionViewCell else {
            return CategoriesCollectionViewCell()
        }

        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}

extension CategoriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(CategoryDetailListViewController(), animated: true)

    }
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
        return UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }
}
