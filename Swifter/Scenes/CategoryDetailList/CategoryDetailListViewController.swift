//
//  CategoryDetailListViewController.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 08.04.2023.
//

import UIKit

class CategoryDetailListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
        setSettingNavigationBar()
    }

    private func setSettingNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .white

        navigationBar?.standardAppearance = navBarAppearance
        navigationBar?.scrollEdgeAppearance = navBarAppearance

    }

}
