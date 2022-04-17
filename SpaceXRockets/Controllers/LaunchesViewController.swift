//
//  LaunchesViewController.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 17.04.2022.
//

import UIKit

class LaunchesViewController: UIViewController, LinkViewAndController {
    typealias RootView = LaunchesView

    var launches = Launches()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func loadView() {
        self.view = LaunchesView()
    }

    func reload() {
        view().launchTableView.reloadData()
    }
}

extension LaunchesViewController {
    func configureView() {
        view().launchTableView.delegate = self
        view().launchTableView.dataSource = self
    }
}

extension LaunchesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: LaunchTableViewCell.identifier, for: indexPath) as! LaunchTableViewCell
        cell.configure(
            name: launches[indexPath.row].name,
            dateUnix: launches[indexPath.row].dateUnix,
            success: launches[indexPath.row].success!
        )
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(116)
    }
}
