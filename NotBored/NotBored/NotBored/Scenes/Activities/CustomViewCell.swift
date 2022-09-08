//
//  CustomViewCell.swift
//  NotBored
//
//  Created by Antonella Brini Vago on 07/09/2022.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    private lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.layoutMargins = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var cellText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 27, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var rightImage: UIImageView = {
        let imgView = UIImageView()
        let boldConfig = UIImage.SymbolConfiguration(weight: .black)
        imgView.image = UIImage(systemName: "chevron.right", withConfiguration: boldConfig)
        imgView.tintColor = .black
        //            imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(cellStackView)
        cellStackView.addArrangedSubview(dataStackView)
        dataStackView.addArrangedSubview(cellText)
        iconContainer.addSubview(rightImage)
        dataStackView.addArrangedSubview(iconContainer)
        cellStackView.addArrangedSubview(cellSeparator())
    }

    func setupContraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rightImage.topAnchor.constraint(equalTo: iconContainer.topAnchor),
            rightImage.leadingAnchor.constraint(equalTo: iconContainer.leadingAnchor),
            rightImage.trailingAnchor.constraint(equalTo: iconContainer.trailingAnchor),
            rightImage.bottomAnchor.constraint(equalTo: iconContainer.bottomAnchor),
            rightImage.heightAnchor.constraint(equalToConstant: 27),
            rightImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func cellSeparator() -> UIView {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .black
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
        return separator
    }
    
    func setData(_ activity: String) {
        cellText.text = activity
    }

}
