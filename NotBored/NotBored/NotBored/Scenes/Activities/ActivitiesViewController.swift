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
        table.rowHeight = 60.0
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupViews()
        setupConstraints()
        setup()
        table.reloadData()
    }
    
    func setupNavBar() {
        tabBarController?.navigationItem.title = "Activities"
    }
    
    func setup() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
    }
    
    func setupViews() {
        view.addSubview(table)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.bottomAnchor),
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = itemsActivities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
