//
//  ActivitiesViewController.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import UIKit

class ActivitiesViewController: BaseViewController {
    let activitiesViewModel = ActivitiesViewModel()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.backgroundColor = nil
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
        activitiesViewModel.delegate = self
        setupNavBar()
        setupViews()
        setupConstraints()
        table.reloadData()
    }
    
    private func setupNavBar() {
        tabBarController?.navigationItem.title = "Activities"
    }
    
    private func setupViews() {
        view.addSubview(table)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func getActivity(category: String) {
        activitiesViewModel.getActivity(participants: 80, priceRange: .free, category: category)
    }
}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitiesViewModel.itemsActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomViewCell.self)", for: indexPath) as? CustomViewCell else {
            return UITableViewCell()
        }
        
        let activity = activitiesViewModel.itemsActivities[indexPath.row]
        cell.setData(activity.capitalized)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getActivity(category: activitiesViewModel.itemsActivities[indexPath.row])
    }
}

extension ActivitiesViewController: ActivitiesDelegateProtocol {
    func activityLoaded(activity: Activities) {
        print(activity)
    }
    
    func errorHandler(error: String) {
        print(error)
    }
}
