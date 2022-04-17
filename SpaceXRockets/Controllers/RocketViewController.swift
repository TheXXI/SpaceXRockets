//
//  RocketInformationViewController.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 17.04.2022.
//

import UIKit
import Kingfisher

class RocketViewController: UIViewController, LinkViewAndController {
typealias RootView = RocketView

    // MARK: - Public properties

    var rocket: Rocket?
    var launches: Launches?

    // MARK: - Private properties

    private var settingButton: UIButton?
    private var lookLaunchesButton: UIButton?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(rocket: rocket!)
    }

    override func loadView() {
        self.view = RocketView()
    }

    // MARK: - Actions

    @objc func settingButtonAction(sender: UIButton!) {
        let controller = SettingsViewController()
        controller.title = "Настройки"
        let navController = UINavigationController(rootViewController: controller)
        present(navController, animated: true)
    }

    @objc func lookLaunchesButtonAction(sender: UIButton!) {
        let controller = LaunchesViewController()
        controller.launches = launches!
        navigationController!.pushViewController(controller, animated: true)
    }

}

// MARK: - Extensions

extension RocketViewController {
    func configureView(rocket: Rocket) {
        let url = URL(string: rocket.flickrImages[0])
        view().rocketImageView.kf.setImage(with: url!)

        configureButtons()

        view().setName(name: rocket.name)
        view().setGeneralInfo(
            firstLaunch: rocket.firstFlight,
            counrty: rocket.country,
            cost: rocket.costPerLaunch
        )
        view().setFirstStageInfo(
            engines: rocket.firstStage.engines,
            fuel: Int(rocket.firstStage.fuelAmountTons),
            burnTime: rocket.firstStage.burnTimeSEC ?? 0
        )

        view().setSecondStageInfo(
            engines: rocket.secondStage.engines,
            fuel: Int(rocket.secondStage.fuelAmountTons),
            burnTime: rocket.secondStage.burnTimeSEC ?? 0

        )
        configureCollection()
    }

    private func configureButtons() {
        settingButton = view().headerView.settingsButton
        lookLaunchesButton = view().lookLaunchesButton
        settingButton!.addTarget(self, action: #selector(settingButtonAction), for: .touchUpInside)
        lookLaunchesButton!.addTarget(self, action: #selector(lookLaunchesButtonAction), for: .touchUpInside)

    }

    private func configureCollection() {
        view().parametersCollectionView.delegate = self
        view().parametersCollectionView.dataSource = self
    }
}

extension RocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParametersCollectionCell.identifier, for: indexPath) as! ParametersCollectionCell
        var value: String?
        switch indexPath.item {
        case 0:
            value = "\(String(describing: rocket!.height.feet!))"
        case 1:
            value = "\(String(describing: rocket!.diameter.feet!))"
        case 2:
            value = "\(String(describing: rocket!.mass.lb))"
        case 3:
            value = "\(String(describing: rocket!.payloadWeights[0].lb))"
        default:
            value = " "
        }
        cell.configure(index: indexPath.item, value: value!)
        return cell
    }
}
