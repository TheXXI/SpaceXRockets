//
//  MainViewController.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 25.03.2022.
//

import UIKit

class MainViewController: UIViewController, LinkViewAndController {
    typealias RootView = MainView

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(rocketsCount: 4)
    }

    override func loadView() {
        self.view = MainView()
    }
}
