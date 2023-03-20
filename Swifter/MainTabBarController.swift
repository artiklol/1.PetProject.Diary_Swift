//
//  MainTabBarController.swift
//  Swifter
//
//  Created by Artem Sulzhenko on 20.03.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showTabBar()
    }

//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let barButtonView = item.value(forKey: "view") as? UIView else { return }
//
//        let animationLength: TimeInterval = 0.3
//        let propertyAnimator = UIViewPropertyAnimator(duration: animationLength, dampingRatio: 0.5) {
//            barButtonView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
//        }
//        propertyAnimator.addAnimations({ barButtonView.transform = .identity },
//                                       delayFactor: CGFloat(animationLength))
//        propertyAnimator.startAnimation()
//    }

    private func showTabBar() {
        let mainVC = UINavigationController(rootViewController: ViewController())
        viewControllers = [
            generateViewController(
                viewController: mainVC,
                title: "Главная",
                defaultImage: UIImage(systemName: "0.circle"),
                selectedImage: UIImage(systemName: "0.circle.fill")
            ),
            generateViewController(
                viewController: MainViewController(),
                title: "Логин",
                defaultImage: UIImage(systemName: "0.square"),
                selectedImage: UIImage(systemName: "0.square.fill")
            )
        ]
        tabBar.backgroundColor = .white
        UITabBar.appearance().tintColor = .black
    }

    private func generateViewController(viewController: UIViewController, title: String,
                                        defaultImage: UIImage?, selectedImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = defaultImage
        viewController.tabBarItem.selectedImage = selectedImage
        return viewController
    }

}
