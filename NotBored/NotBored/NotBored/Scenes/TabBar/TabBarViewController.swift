//
//  TabBarViewController.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    let vc1 = ActivitiesViewController()
    let vc2 = SuggestionsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setControllers()
    }
    
    private func setupTabBar() {
        tabBar.barTintColor = .backgroundColor
//
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = .mainColor
//        navBarAppearance.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35, weight: .bold)]
//        tabBarController?.navigationController.navigationBar.standardAppearance = navBarAppearance
//        tabBarController?.navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
//        tabBarController?.navigationController.navigationBar.topItem?.backButtonTitle = ""
    }
    
    func setControllers() {
        let icon1 = UIImage(systemName: "list.bullet")
        let icon1Selected = UIImage(systemName: "list.bullet")
        vc1.tabBarItem = UITabBarItem(title: "Activities",
                                      image: icon1,
                                      selectedImage: icon1Selected)
        
        let icon2 = UIImage(systemName: "shuffle.circle")
        let icon2Selected = UIImage(systemName: "shuffle.circle.fill")
        vc2.tabBarItem = UITabBarItem(title: "Random",
                                      image: icon2,
                                      selectedImage: icon2Selected)
        
        self.setViewControllers([vc1, vc2], animated: true)
    }
    
    public func updateControllers(participants: Int, priceRange: PriceRanges){
        vc1.updateView(participants: participants, priceRange: priceRange)
        vc2.getActivity(participants: participants, priceRange: priceRange, category: nil)
    }
}
