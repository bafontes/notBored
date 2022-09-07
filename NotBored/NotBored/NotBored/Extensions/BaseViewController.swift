//
//  BaseViewController.swift
//  NotBored
//
//  Created by Bruno Andres Fontes on 6/9/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.tintColor = .black
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .mainColor
        navBarAppearance.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold)]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}
