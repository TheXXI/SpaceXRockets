//
//  LaunchesView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 17.04.2022.
//

import UIKit

class LaunchesView: UIView {

    let launchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LaunchTableViewCell.self, forCellReuseIdentifier: LaunchTableViewCell.identifier  )
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .black

        addSubview(launchTableView)
        NSLayoutConstraint.activate([
            launchTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            launchTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            launchTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            launchTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
