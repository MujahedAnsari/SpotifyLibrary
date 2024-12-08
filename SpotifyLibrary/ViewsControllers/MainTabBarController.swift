//
//  MainTabBarController.swift
//  SpotifyLibrary
//
//  Created by Mujahed Ansari on 07/12/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)

        let searchVC = UINavigationController(rootViewController: MusicSearchViewController())
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        let libraryVC = UINavigationController(rootViewController: LibraryViewController())
        libraryVC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical.fill"), tag: 2)

        viewControllers = [homeVC, searchVC, libraryVC]
        tabBar.barStyle = .black
        tabBar.tintColor = .green
        self.selectedIndex = 2
    }
}
