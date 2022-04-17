//
//  RocketDetailsView.swift
//  SpaceXRockets
//
//  Created by Михаил Курис on 25.03.2022.
//

import UIKit

class RocketView: UIView {

    // MARK: - Public properties

    var headerView: HeaderView!
    var parametersCollectionView: UICollectionView!

    let lookLaunchesButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.tintColor = UIColor(named: "textWhite")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
        button.backgroundColor = UIColor(named: "cellsColor")
        button.setTitle("Посмотреть запуски", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()

    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var generalInformationView: GeneralInformationView!
    private var firstStageInformationView: StageInformationView!
    private var secondStageInformationView: StageInformationView!

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func setName(name: String) {
        headerView.configure(rocketName: name)
    }

    func setGeneralInfo(firstLaunch: String, counrty: String, cost: Int) {
        generalInformationView.setupValues(
            firstLaunch: firstLaunch,
            counrty: counrty,
            cost: cost
        )
    }

    func setFirstStageInfo(engines: Int, fuel: Int, burnTime: Int) {
        firstStageInformationView.setupValues(
            engines: engines,
            fuel: fuel,
            burnTime: burnTime
        )
    }

    func setSecondStageInfo(engines: Int, fuel: Int, burnTime: Int) {
        secondStageInformationView.setupValues(
            engines: engines,
            fuel: fuel,
            burnTime: burnTime
        )
    }

    // MARK: - Private methods

    private func configureUI() {
        addSubview(scrollView)
        setupScrollViewConstraints()
        scrollView.addSubview(rocketImageView)
        setupRocketImageViewConstraints()

        headerView = HeaderView()
        scrollView.addSubview(headerView)
        setupHeaderViewConstraints()

        createParametersCollectionView()

        generalInformationView = GeneralInformationView()

        scrollView.addSubview(generalInformationView)
        setupGeneralInformationViewConstraints()

        firstStageInformationView = StageInformationView()
        firstStageInformationView.setupHeaderText(headerText: "ПЕРВАЯ СТУПЕНЬ")
        scrollView.addSubview(firstStageInformationView)
        setupStageInformationViewConstraints(currentView: firstStageInformationView)

        secondStageInformationView = StageInformationView()
        secondStageInformationView.setupHeaderText(headerText: "ВТОРАЯ СТУПЕНЬ")
        scrollView.addSubview(secondStageInformationView)
        setupStageInformationViewConstraints(currentView: secondStageInformationView)

        scrollView.addSubview(lookLaunchesButton)
        setupLookLaunchesButtonConstraints()
    }

    private func createParametersCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        parametersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        parametersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        parametersCollectionView.register(ParametersCollectionCell.self, forCellWithReuseIdentifier: ParametersCollectionCell.identifier)
        parametersCollectionView.showsHorizontalScrollIndicator = false
        parametersCollectionView.backgroundColor = .black
        scrollView.addSubview(parametersCollectionView)

        setupParametersCollectionViewConstraints()
    }

    // MARK: - Add Constraints

    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupRocketImageViewConstraints() {
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func setupHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -32),
            headerView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setupParametersCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            parametersCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            parametersCollectionView.heightAnchor.constraint(equalToConstant: 120),
            parametersCollectionView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            parametersCollectionView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -32)
        ])
    }

    private func setupGeneralInformationViewConstraints() {
        NSLayoutConstraint.activate([
            generalInformationView.topAnchor.constraint(equalTo: parametersCollectionView.bottomAnchor, constant: 40),
            generalInformationView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            generalInformationView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            generalInformationView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }

    private func setupStageInformationViewConstraints(currentView: StageInformationView) {
        var constraints = [
            currentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            currentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            currentView.heightAnchor.constraint(equalToConstant: 216)
        ]

        if currentView == firstStageInformationView {
            constraints.append(currentView.topAnchor.constraint(equalTo: generalInformationView.bottomAnchor, constant: 40))
        } else {
            constraints.append(currentView.topAnchor.constraint(equalTo: firstStageInformationView.bottomAnchor, constant: 40))
        }
        NSLayoutConstraint.activate(constraints)
    }

    private func setupLookLaunchesButtonConstraints() {
        NSLayoutConstraint.activate([
            lookLaunchesButton.topAnchor.constraint(equalTo: secondStageInformationView.bottomAnchor),
            lookLaunchesButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            lookLaunchesButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            lookLaunchesButton.heightAnchor.constraint(equalToConstant: 70),
            lookLaunchesButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])
    }
}
