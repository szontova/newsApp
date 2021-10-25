//
//  TabBarController.swift
//  newsApp
//
//  Created by User on 22.10.21.
//

import UIKit

class TabBarController: UITabBarController {
    let images = ["newspaper.fill", "person.fill", "gearshape.2.fill"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBar()
    }
    
    // MARK: - Setup
    private func setupTabBar() {
        self.tabBar.barStyle = .black
        self.tabBar.tintColor = .lime
        setupTabBarImages()
    }
    
    private func setupTabBarImages() {
        guard let items = self.tabBar.items else { return }
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
    }
    
    private func setupViewControllers() {
        let firstVC = setupFirstViewControllers()
        let secondVC = setupSecondViewControllers()
        let thirdVC = setupThirdViewControllers()
        self.setViewControllers([firstVC, secondVC, thirdVC], animated: false)
    }
    
    private func setupFirstViewControllers() -> UIViewController {
        let newsVC = NewsViewController()
        newsVC.title = "news_title".localized()
        return newsVC
    }
    
    private func setupSecondViewControllers() -> UIViewController {
        let profileVC = ProfileViewController()
        profileVC.title = "profile_title".localized()
        return profileVC
    }
    
    private func setupThirdViewControllers() -> UIViewController {
        let settingsVC = SettingsViewController()
        settingsVC.title = "settings_title".localized()
        return settingsVC
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "profile_title".localized() {
            tabBar.tintColor = .richYellow
        } else if item.title == "settings_title".localized() {
            tabBar.tintColor = .carrot
        } else {
            tabBar.tintColor = .lime
        }
    }
}
           
