//
//  ActivitiesViewController.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import UIKit

class ActivitiesViewController: BaseViewController {
    
    var itemsActivities: [String] = ["Education", "Recreation", "Social", "Diy", "Charity", "Cooking", "Relaxation", "Music", "Busywork", "Another", "Another 2"]
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.backgroundColor = nil
//        table.separatorColor = .black
//        table.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        table.separatorStyle = .none
        table.dataSource = self
        table.delegate = self
        table.register(CustomViewCell.self, forCellReuseIdentifier: "\(CustomViewCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupViews()
        setupConstraints()
//        setup()
        table.reloadData()
    }
    
    func setupNavBar() {
        tabBarController?.navigationItem.title = "Activities"
    }
    
//    func setup() {
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
//    }
    
    func setupViews() {
        view.addSubview(table)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomViewCell.self)", for: indexPath) as? CustomViewCell else {
            return UITableViewCell()
        }
        
        let activity = itemsActivities[indexPath.row]
        cell.setData(activity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
