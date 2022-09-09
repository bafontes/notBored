//
//  ActivitiesViewController.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import UIKit

class ActivitiesViewController: BaseViewController {
    let activitiesViewModel = ActivitiesViewModel()
    
    var participants: Int?
    var priceRange: PriceRanges?
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .backgroundColor
        table.dataSource = self
        table.delegate = self
        table.register(CustomViewCell.self, forCellReuseIdentifier: "\(CustomViewCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupNavBar()
        setupViews()
        setupConstraints()
        table.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
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
    
    public func updateView(participants: Int, priceRange: PriceRanges){
        self.participants = participants
        self.priceRange = priceRange
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
                
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0.039, green: 0.569, blue: 0.914, alpha: 0.200)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SuggestionsViewController()
        vc.getActivity(participants: participants ?? 1, priceRange: priceRange ?? .free, category: activitiesViewModel.itemsActivities[indexPath.row])
        tabBarController?.navigationController?.pushViewController(vc, animated: true)
    }
}
