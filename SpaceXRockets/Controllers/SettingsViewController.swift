//
//  SettingsViewController.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 17.04.2022.
//

import UIKit

class SettingsViewController: UIViewController, LinkViewAndController {
    typealias RootView = SettinsView

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        self.view = SettinsView()
    }
}
