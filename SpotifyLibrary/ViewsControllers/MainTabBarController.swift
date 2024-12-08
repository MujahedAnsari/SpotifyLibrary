//
//  MainTabBarController.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 08/12/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: Constants.home, image: UIImage(systemName: Constants.imageName.housefill), tag: 0)

        let searchVC = UINavigationController(rootViewController: MusicSearchViewController())
        searchVC.tabBarItem = UITabBarItem(title: Constants.search, image: UIImage(systemName: Constants.imageName.magnifyingglass), tag: 1)

        let libraryVC = UINavigationController(rootViewController: LibraryViewController())
        libraryVC.tabBarItem = UITabBarItem(title: Constants.library, image: UIImage(systemName: Constants.imageName.booksVerticalFill), tag: 2)

        viewControllers = [homeVC, searchVC, libraryVC]
        tabBar.barStyle = .black
        tabBar.tintColor = .green
        self.selectedIndex = 2
    }
}
