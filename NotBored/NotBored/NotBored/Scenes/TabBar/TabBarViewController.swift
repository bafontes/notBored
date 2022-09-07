//
//  TabBarViewController.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
    }
    
    func setControllers() {
        let vc1 = ActivitiesViewController()
        let icon1 = UIImage(systemName: "list.bullet")
        let icon1Selected = UIImage(systemName: "list.bullet")
        vc1.tabBarItem = UITabBarItem(title: "Activities",
                                      image: icon1,
                                      selectedImage: icon1Selected)
        
        let vc2 = HomeViewController()
        let icon2 = UIImage(systemName: "shuffle.circle")
        let icon2Selected = UIImage(systemName: "shuffle.circle.fill")
        vc2.tabBarItem = UITabBarItem(title: "Random",
                                      image: icon2,
                                      selectedImage: icon2Selected)
        
        self.setViewControllers([vc1, vc2], animated: true)
    }
}
